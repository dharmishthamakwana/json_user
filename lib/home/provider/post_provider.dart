import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../modal/post_modal.dart';

class Postprovider extends ChangeNotifier {
  List<dynamic> postList = [];
  int i=0;

  Future<void> postJsonParshing() async {
    String postJsonString =
        await rootBundle.loadString("assets/json/post.json");
    var postJson = jsonDecode(postJsonString);
    List<dynamic> postJsonList =
        postJson.map((e) => PostModel().jsonFromPostModel(e)).toList();
    postList = postJsonList;
    notifyListeners();
  }
   void clear()
   {
     i=0;
     notifyListeners();

   }
}
