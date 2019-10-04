import 'package:flutter/material.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class ConfigurarMedidorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configurar Medidor",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      drawer: MenuBar(),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          top: 40,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            Text(
              "Usuários e Pluviômetros",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(4)
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(4)
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 50,
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
                  "Cadastrar",
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