import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/user.bloc.dart';
import 'package:rectec_app/models/user.model.dart';
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
          left: 20,
          right: 20,
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
              height: 60,
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
                    fontSize: 16,
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

  /*Future<List<String>>*/ getUsuarios(context) async {
    var bloc = Provider.of<UserBloc>(context);
    List<User> usuarios = bloc.usuarios;
    List<String> listaNomesUsuarios = new List<String> ();
    for(var i = 0; i <usuarios.length; i++) {
      listaNomesUsuarios.add(usuarios[i].name);
    }
    return listaNomesUsuarios;
  }
}