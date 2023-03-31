import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/albums_provider.dart';

class Albumscreen extends StatefulWidget {
  const Albumscreen({Key? key}) : super(key: key);

  @override
  State<Albumscreen> createState() => _AlbumscreenState();
}

class _AlbumscreenState extends State<Albumscreen> {
  Albumprovider? albumproviderTrue;
  Albumprovider? albumproviderFalse;

  @override
  Widget build(BuildContext context) {
    albumproviderTrue = Provider.of(context, listen: true);
    albumproviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.blue.shade50,
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  leading: Text("${albumproviderTrue!.albumList[index].id}"),
                  title: Text("${albumproviderTrue!.albumList[index].title}"),
                  trailing:
                      Text("${albumproviderTrue!.albumList[index].userId}"),
                ),
              ),
              itemCount: albumproviderTrue!.albumList.length,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900),
                  onPressed: () {
                    albumproviderFalse!.albumJsonParshing();
                  },
                  child: Text(
                    "albums",
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
