import 'package:flutter/material.dart';
import 'package:rectec_app/pages/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecTec',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //fontFamily: "Roboto",
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}