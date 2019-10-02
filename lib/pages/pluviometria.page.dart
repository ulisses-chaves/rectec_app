import 'package:flutter/material.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class PluviometriaPage extends StatelessWidget {

  //final formKey = GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> orderFormKey = GlobalKey<FormFieldState<String>>();
  //DateTime dateNow = DateTime.now(); //vê isso aqui

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
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: this.key, //vê isso aqui
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black87,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Pluviometro",
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
                "Data",
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
                "Hora",
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
                "Lâmina",
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
          )
        )
      ),
    );
  }
}