import 'package:flutter/material.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class CadastrarMedidorPage extends StatelessWidget {
  static final GlobalKey<FormFieldState<String>> orderFormKey = GlobalKey<FormFieldState<String>>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastrar Medidor",
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
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: orderFormKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                )
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "CPF",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                )
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                )
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Endereço",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                )
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                //keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Perfil",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                )
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                //keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Profissão",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                )
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                )
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Confirmar Senha",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                )
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
            ]
          ),
        ),
      ),
    );
  }
}