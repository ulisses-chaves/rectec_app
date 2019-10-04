import 'package:flutter/material.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class NovoPluviometroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Novo Pluviômetro",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )
      ),
      drawer: MenuBar(),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            Text(
              "Nome",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 16
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Data de instalação",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.datetime,
              style: TextStyle(
                fontSize: 16
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Modelo",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 16
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Latitude",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 16
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Longitude",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 16
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(5)
              )
            ),
              child: FlatButton(
                child: Text(
                  "Salvar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}