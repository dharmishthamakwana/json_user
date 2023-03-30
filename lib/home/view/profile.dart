import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/profile_provider.dart';

class Userscreen extends StatefulWidget {
  const Userscreen({Key? key}) : super(key: key);

  @override
  State<Userscreen> createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  @override
  Widget build(BuildContext context) {
    Userprovider? userproviderTrue = Provider.of(context, listen: true);
    Userprovider? userproviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //     backgroundColor: Colors.blue.shade900,
        //     title: Text(
        //       "User",
        //       style:
        //           TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        //     ),
        //     actions: [
        //       IconButton(
        //           onPressed: () {
        //             Navigator.pushNamed(context, 'comment');
        //           },
        //           icon: Icon(Icons.navigate_next)),
        //     ]),
        backgroundColor: Colors.blue.shade50,
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  leading: Text(
                    "${userproviderTrue.userList[index]["id"]}",
                  ),
                  title: Text(
                    "${userproviderTrue.userList[index]["name"]}",
                  ),
                  subtitle: Text(
                    "${userproviderTrue.userList[index]["phone"]}",
                  ),
                  trailing: Text(
                    "${userproviderTrue.userList[index]["email"]}",
                  ),
                ),
              ),
              itemCount: userproviderTrue!.userList.length,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900),
                  onPressed: () {
                    userproviderFalse!.jsomParshing();
                  },
                  child: Text(
                    "user",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
