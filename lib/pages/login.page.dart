import 'package:flutter/material.dart';
import 'package:rectec_app/pages/pluviometria.page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  //final _scaffoldKey = GlobalKey<ScaffoldState>();
  var email = '';
  var password = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[50],
        padding: EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: Form(
          key: _formKey,
          child: ListView( 
            children: <Widget>[
              SizedBox(
                width: 120,
                height: 120,
                child: Image.asset("assets/images/rectec.png"),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  contentPadding: EdgeInsets.only(
                    bottom: 0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Usuário Inválido';
                  }
                  return null;
                },
                onSaved: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
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
                    fontSize: 16
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Senha inválida";
                  }
                  return null;
                },
                onSaved: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
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
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PluviometriaPage()));
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: Image.asset("assets/images/ufrpe.png"),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Text(
                  "UFRPE - 2019",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "sans-serif",
                    fontSize: 13,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}