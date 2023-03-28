import 'package:flutter/material.dart';
import 'package:json_user/home/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import 'home/view/profile.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {'/': (context) => PostScreen()}),
    ),
  );
}
