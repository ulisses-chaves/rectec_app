import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometria/pluviometro.bloc.dart';
import 'package:rectec_app/blocs/pluviometria/user.bloc.dart';
import 'package:rectec_app/models/pluviometria/pluviometro.model.dart';
import 'package:rectec_app/models/pluviometria/user.model.dart';
import 'package:rectec_app/pages/pluviometria/menu.bar.dart';

class ConfigurarMedidorPage extends StatefulWidget {
  @override
  _ConfigurarMedidorPageState createState() => _ConfigurarMedidorPageState();
}

class _ConfigurarMedidorPageState extends State<ConfigurarMedidorPage> {
  String dropdownValueUsuarios = 'Maria Clara Farias';
  String dropdownValuePluviometros = '2018-prae-01';

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
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton<String>(
                    value: dropdownValueUsuarios,
                    icon: Icon(Icons.arrow_drop_down),
                    underline: Container(
                      color: Colors.black38,
                      height: 1,
                    ),
                    onChanged: (data) {
                      setState(() {
                        dropdownValueUsuarios = data;
                      });
                    },
                    items: snapshot.data.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String> (
                        value: value,
                        child: Container(
                          width: 250,
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                  );
                } else return Text("${snapshot.error}");
              },
              future: getNomes(context),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton<String>(
                    value: dropdownValuePluviometros,
                    icon: Icon(Icons.arrow_drop_down),
                    underline: Container(
                      color: Colors.black38,
                      height: 1,
                    ),
                    onChanged: (data) {
                      setState(() {
                        dropdownValuePluviometros = data;
                      });
                    },
                    items: snapshot.data.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String> (
                        value: value,
                        child: Container(
                          width: 250,
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                  );
                } else return Text("${snapshot.error}");
              },
              future: getPluviometros(context),
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

 Future<List<String>> getNomes(BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context);
    List<User> usuarios = bloc.usuarios;
    List<String> listaNomesUsuarios = new List<String> ();
    for(var i = 0; i < usuarios.length; i++) {
      if(usuarios[i].idPerfil != 1) 
        listaNomesUsuarios.add(usuarios[i].name);
    }
    return listaNomesUsuarios;
  }

  Future<List<String>> getPluviometros(BuildContext context) async {
    var bloc = Provider.of<PluviometroBloc>(context);
    List<Pluviometro> pluviometros = bloc.pluviometros;
    List<String> listaNomesPluviometros = new List<String> ();
    for(var i = 0; i <pluviometros.length; i++) {
      listaNomesPluviometros.add(pluviometros[i].nome);
    }
    return listaNomesPluviometros;
  }
}