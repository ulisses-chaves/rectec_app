import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/modelo.bloc.dart';
import 'package:rectec_app/blocs/pluviometro.bloc.dart';
import 'package:rectec_app/blocs/user.bloc.dart';
import 'package:rectec_app/pages/login.page.dart';
import 'package:rectec_app/pages/tabs.page.dart';
import 'blocs/pluviometria.bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
        ChangeNotifierProvider<PluviometroBloc>.value(
          value: PluviometroBloc(),
        ),
        ChangeNotifierProvider<PluviometriaBloc>.value(
          value: PluviometriaBloc(),
        ),
        ChangeNotifierProvider<ModeloBloc>.value(
          value: ModeloBloc(),
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
      home: DefaultTabController(
        length: 2,
        child: TabsPage(),
      ),
    );
  }
}