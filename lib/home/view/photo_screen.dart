import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/photo_provider.dart';

class Photoscreen extends StatefulWidget {
  const Photoscreen({Key? key}) : super(key: key);

  @override
  State<Photoscreen> createState() => _PhotoscreenState();
}

class _PhotoscreenState extends State<Photoscreen> {
  Photoprovider? photoproviderTrue;
  Photoprovider? photoproviderFalse;

  @override
  Widget build(BuildContext context) {
    photoproviderTrue = Provider.of(context, listen: true);
    photoproviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blueGrey.shade900,
        //   title: Text(
        //     "Photos",
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           Navigator.pushNamed(context, 'album');
        //         },
        //         icon: Icon(Icons.navigate_next)),
        //   ],
        // ),
        backgroundColor: Colors.blueGrey.shade50,
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  leading: Text("${photoproviderTrue!.photoList[index].id}"),
                  trailing:
                      Text("${photoproviderTrue!.photoList[index].albumId}"),
                  title: Text("${photoproviderTrue!.photoList[index].title}"),
                  subtitle: Text("${photoproviderTrue!.photoList[index].url}"),
                ),
              ),
              itemCount: photoproviderFalse!.photoList.length,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900),
                  onPressed: () {
                    photoproviderFalse!.photoJsonParshing();
                  },
                  child: Text(
                    "photo",
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
