import 'package:flutter/material.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class PluviometriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pluviometria",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      drawer: MenuBar(),
    );
  }
}