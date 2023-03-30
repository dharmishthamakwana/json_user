import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../modal/photo_modal.dart';

class Photoprovider extends ChangeNotifier
{
  List photoList = [];

  Future<void> photoJsonParshing()
  async {
    String photoJsonString = await rootBundle.loadString("assets/json/photos.json");
    var jsonPhoto = jsonDecode(photoJsonString);
    List jsonPhotoList = jsonPhoto.map((e)=>Photomodel().jsonFromPhoto(e)).toList();
    photoList = jsonPhotoList;
    notifyListeners();
  }
}