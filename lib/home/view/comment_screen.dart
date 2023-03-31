import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/comment_provider.dart';

class Commentscreen extends StatefulWidget {
  const Commentscreen({Key? key}) : super(key: key);

  @override
  State<Commentscreen> createState() => _CommentscreenState();
}

class _CommentscreenState extends State<Commentscreen> {
  Commentprovider? commentproviderTrue;
  Commentprovider? commentproviderFalse;

  @override
  Widget build(BuildContext context) {
    commentproviderTrue = Provider.of<Commentprovider>(context, listen: true);
    commentproviderFalse = Provider.of<Commentprovider>(context, listen: false);

    return SafeArea(
      child: Scaffold(


        backgroundColor: Colors.blueGrey.shade100,
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
                  leading:
                      Text("${commentproviderTrue!.commentList[index].id}"),
                  trailing:
                      Text("${commentproviderTrue!.commentList[index].postId}"),
                  title:
                      Text("${commentproviderTrue!.commentList[index].name}"),
                  subtitle:
                      Text("${commentproviderTrue!.commentList[index].email}"),
                ),
              ),
              itemCount: commentproviderTrue!.commentList.length,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade900),
                  onPressed: () {
                    commentproviderFalse!.CommentJsonParshing();
                  },
                  child: Text(
                    "comment",
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
