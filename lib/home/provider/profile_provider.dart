import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class UserProvider extends ChangeNotifier {
  List<dynamic> profiletList = [];

  Future<void> jsonParsing() async {
    String jsonDataString =
    await rootBundle.loadString("assets/json/user.json");
    var json = jsonDecode(jsonDataString);
    profiletList = json;
    notifyListeners();
  }
}