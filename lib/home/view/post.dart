import 'dart:html';

import 'package:flutter/material.dart';
import 'package:json_user/home/provider/profile_provider.dart';

import 'package:provider/provider.dart';

import '../provider/post_provider.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({Key? key}) : super(key: key);

  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  Postprovider? postproviderTrue;
  Postprovider? postproviderFalse;
  Userprovider? userproviderTrue;
  Userprovider? userproviderFalse;

  @override
  Widget build(BuildContext context) {
    postproviderTrue = Provider.of<Postprovider>(context, listen: true);
    postproviderFalse = Provider.of<Postprovider>(context, listen: false);
    userproviderTrue = Provider.of<Userprovider>(context, listen: true);
    userproviderFalse = Provider.of<Userprovider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blueGrey.shade900,
        //   title: Text(
        //     "Post",
        //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           Navigator.pushNamed(context, 'user');
        //         },
        //         icon: Icon(Icons.navigate_next_sharp))
        //   ],
        // ),
        backgroundColor: Colors.blueGrey.shade50,
        body: Stack(
          children: [
            ListView.builder(
              itemCount: postproviderTrue!.postList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: OutlineInputBorder(
                    gapPadding: 2,
                    borderSide: BorderSide(),
                  ),
                  enabled: true,
                  leading: Text("${postproviderTrue!.postList[index].id}"),
                  title: Text("${postproviderTrue!.postList[index].title}"),
                  subtitle: Text("${postproviderTrue!.postList[index].body}"),
                  trailing: Text("${postproviderTrue!.postList[index].userId}"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade900),
                  onPressed: () {
                    postproviderFalse!.postJsonParshing();
                  },
                  child: Text(
                    "post",
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
