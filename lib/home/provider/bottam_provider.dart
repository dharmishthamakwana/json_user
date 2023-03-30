import 'package:flutter/cupertino.dart';

import '../view/albums._Screen.dart';
import '../view/comment_screen.dart';
import '../view/photo_screen.dart';
import '../view/post.dart';
import '../view/profile.dart';
import '../view/todo_screen.dart';

class BottamProvider extends ChangeNotifier {
  int navigationIndex = 0;

  List screenList = [
    Postscreen(),
    Userscreen(),
    Commentscreen(),
    Albumscreen(),
    Photoscreen(),
    Todoscreen(),
  ];

  void changeIndex(int value) {
    navigationIndex = value;
    notifyListeners();
  }
}
