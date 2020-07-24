import 'package:flutter/material.dart';
import 'package:rectec_app/pages/alerta/alerta.menu.dart';

class NotificacaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Mapa",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      drawer: AlertaMenuBar(),
      body: Container(
        color: Colors.blueGrey[50],
        padding: EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: Form(
          //key: _loginKey,
          child: ListView( 
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Local 1",
                  contentPadding: EdgeInsets.only(
                    bottom: 0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Local 2",
                  contentPadding: EdgeInsets.only(
                    bottom: 0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Local 3",
                  contentPadding: EdgeInsets.only(
                    bottom: 0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Local 4",
                  contentPadding: EdgeInsets.only(
                    bottom: 0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5)
                  )
                ),
                child: FlatButton(
                  child: Text(
                    "Salvar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    /*if (_loginKey.currentState.validate()) {
                      _loginKey.currentState.save();
                      autenticar(context);
                    }
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PluviometriaPage()));*/
                  },
                ),
              ),
            ]
          )
        )
      )
    );
  }
}