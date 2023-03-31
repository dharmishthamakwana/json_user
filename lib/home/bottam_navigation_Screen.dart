import 'package:flutter/material.dart';
import 'package:json_user/home/provider/bottam_provider.dart';
import 'package:json_user/home/view/albums._Screen.dart';
import 'package:json_user/home/view/comment_screen.dart';
import 'package:json_user/home/view/photo_screen.dart';
import 'package:json_user/home/view/post.dart';
import 'package:json_user/home/view/profile.dart';
import 'package:json_user/home/view/todo_screen.dart';
import 'package:provider/provider.dart';

class BottamScreen extends StatefulWidget {
  const BottamScreen({Key? key}) : super(key: key);

  @override
  State<BottamScreen> createState() => _BottamScreenState();
}

class _BottamScreenState extends State<BottamScreen> {
  BottamProvider? bottamProviderTrue;
  BottamProvider? bottamProviderFalse;

  @override
  Widget build(BuildContext context) {
    bottamProviderFalse = Provider.of<BottamProvider>(context, listen: false);
    bottamProviderTrue = Provider.of<BottamProvider>(context, listen: true);
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey.shade900,
            title: Text("Json Parsing",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.post_add_outlined, color: Colors.white),
                  child: Text('post', style: TextStyle(color: Colors.white)),
                ),
                Tab(
                  icon: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                  ),
                  child: Text(
                    'user',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.comment,
                    color: Colors.white,
                  ),
                  child: Text(
                    'comment',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.album,
                    color: Colors.white,
                  ),
                  child: Text(
                    'Albums',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.photo,
                    color: Colors.white,
                  ),
                  child: Text(
                    'Photos',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.today_outlined,
                    color: Colors.white,
                  ),
                  child: Text(
                    'Todo',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Postscreen(),
              Userscreen(),
              Commentscreen(),
              Albumscreen(),
              Photoscreen(),
              Todoscreen(),
            ],
           
          ),
        ),
      ),
    );
  }
}
