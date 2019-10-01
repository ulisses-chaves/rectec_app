import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.cloud),
      //   title: Text("RecTec"),
      // ),
      body: Container(
        color: Color.fromRGBO(233, 236, 239, 1),
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset("assets/rectec.png"),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                contentPadding: EdgeInsets.only(
                  bottom: 0,
                ),
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                ),
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                contentPadding: EdgeInsets.only(
                  bottom: 0,
                ),
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                ),
              )
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(5)
                )
              ),
              child: FlatButton(
                child: Text(
                  "Entrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset("assets/ufrpe.png"),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Text(
                "UFRPE 2019",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "sans-serif",
                  fontSize: 14
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}