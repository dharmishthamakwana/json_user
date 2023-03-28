import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/profile_provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  UserProvider? userProviderTrue;
  UserProvider? userProviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).jsonParsing();
  }

  @override
  Widget build(BuildContext context) {
    userProviderFalse = Provider.of<UserProvider>(context, listen: false);
    userProviderTrue = Provider.of<UserProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          bottomOpacity: 5,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "User Data json",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     postProviderFalse!.jsonParsing();
            //   },
            //   child: Text("Save data"),
            // ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4)),
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Text(
                          "${userProviderTrue!.profiletList[index]['id']}"),
                      title: Text(
                          "${userProviderTrue!.profiletList[index]['name']}"),
                      subtitle: Text(
                          "${userProviderTrue!.profiletList[index]['username']}"),
                      trailing: Text(
                          "${userProviderTrue!.profiletList[index]['phone']}"),
                    ),
                  );
                },
                itemCount: userProviderTrue!.profiletList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
