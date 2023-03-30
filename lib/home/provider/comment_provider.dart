import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../modal/comment_modal.dart';

class Commentprovider extends ChangeNotifier {
  List<dynamic> commentList = [];

  Future<void> CommentJsonParshing() async {
    String commentJsonString =
        await rootBundle.loadString("assets/json/commment.json");
    var jsonComment = jsonDecode(commentJsonString);
    List jsonCommentList =
        jsonComment.map((e) => CommentModel().jsonFromComment(e)).toList();
    commentList = jsonCommentList;
    notifyListeners();
  }
}
