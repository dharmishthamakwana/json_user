import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modal/todo_modal.dart';

class Todoprovider extends ChangeNotifier
{
  List todoList = [];

  Future<void> todoJsonParshing()
  async {
    String todoJsonString = await rootBundle.loadString("assets/json/todo.json");
    var jsonTodo = jsonDecode(todoJsonString);
    List jsonTodoList = jsonTodo.map((e)=>TodoModel().jsonFromTodo(e)).toList();
    todoList = jsonTodoList;
    notifyListeners();
  }
}