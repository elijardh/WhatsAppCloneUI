import 'package:flutter/material.dart';
import 'package:whatsappui/View/Landing.dart';
import 'package:whatsappui/View/Chat.dart';
import 'package:whatsappui/View/Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
/*
  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double tabWidth(BuildContext context) {
    return screenSize(context).width / 4;
  }
*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.grey,
          primaryColor: Color.fromRGBO(30, 98, 64, 1.0),

          tabBarTheme: TabBarTheme()
        ),
        debugShowCheckedModeBanner: false,
        home: Landing());
  }
}
