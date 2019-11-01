import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/user.bloc.dart';
import 'package:rectec_app/pages/login.page.dart';
import 'blocs/pluviometria.bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserBlock>.value(
          value: UserBlock(),
        ),
        ChangeNotifierProvider<PluviometriaBlock>.value(
          value: PluviometriaBlock(),
        )
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecTec',
      //debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}