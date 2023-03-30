import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';

class Todoscreen extends StatefulWidget {
  const Todoscreen({Key? key}) : super(key: key);

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  Todoprovider? todoproviderTrue;

  @override
  Widget build(BuildContext context) {
    todoproviderTrue = Provider.of(context, listen: true);
    Todoprovider todoproviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blue.shade900,
        //   title: Text(
        //     "Todo",
        //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           Navigator.pushNamed(context, 'photo');
        //         },
        //         icon: Icon(Icons.navigate_next)),
        //   ],
        // ),
        backgroundColor: Colors.blue.shade50,
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  leading: Text("${todoproviderTrue!.todoList[index].id}"),
                  trailing: Text("${todoproviderTrue!.todoList[index].userId}"),
                  title: Text("${todoproviderTrue!.todoList[index].title}"),
                  subtitle:
                      Text("${todoproviderTrue!.todoList[index].completed}"),
                ),
              ),
              itemCount: todoproviderTrue!.todoList.length,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade900),
                  onPressed: () {
                    todoproviderFalse!.todoJsonParshing();
                  },
                  child: Text(
                    "todo",
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
