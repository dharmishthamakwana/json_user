import 'package:flutter/material.dart';
import 'package:json_user/home/provider/bottam_provider.dart';

import 'package:provider/provider.dart';

import 'home/bottam_navigation_Screen.dart';
import 'home/provider/albums_provider.dart';
import 'home/provider/comment_provider.dart';
import 'home/provider/photo_provider.dart';
import 'home/provider/post_provider.dart';
import 'home/provider/profile_provider.dart';
import 'home/provider/todo_provider.dart';
import 'home/view/albums._Screen.dart';
import 'home/view/comment_screen.dart';
import 'home/view/photo_screen.dart';
import 'home/view/post.dart';
import 'home/view/profile.dart';
import 'home/view/todo_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Userprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Postprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Albumprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottamProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Commentprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Photoprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Todoprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => BottamScreen(),
          'post': (context) => Postscreen(),
          'user': (context) => Userscreen(),
          'comment': (context) => Commentscreen(),
          'todo': (context) => Todoscreen(),
          'photo': (context) => Photoscreen(),
          'album': (context) => Albumscreen()
        },
      ),
    ),
  );
}
