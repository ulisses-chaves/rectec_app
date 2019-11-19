import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/user.bloc.dart';
import 'package:rectec_app/pages/cadastrar.medidor.page.dart';
import 'package:rectec_app/pages/configurar.medidor.page.dart';
import 'package:rectec_app/pages/historico.page.dart';
import 'package:rectec_app/pages/login.page.dart';
import 'package:rectec_app/pages/novo.pluviometro.page.dart';
import 'package:rectec_app/pages/pluviometria.page.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.cloud,
                      color: Colors.white,
                      size: 45,
                    ),
                    title: Text(
                      "RecTec",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot,) {
                      if (snapshot.hasData) {
                        return Text(
                          "Bem vindo, ${snapshot.data}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        );
                      }
                      else return Text("Não tá logado!");
                    },
                    future: pegarNome(context),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.opacity),
            title: Text(
              "Pluviometria",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            selected: true,
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => PluviometriaPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text(
              "Cadastrar Medidor",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => CadastrarMedidorPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.people),
            title: Text(
              "Configurar Medidor",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ConfigurarMedidorPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text(
              "Novo Pluviometro",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => NovoPluviometroPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.web),
            title: Text(
              "Histórico",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricoPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.directions_run),
            title: Text(
              "Sair",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  Future<String> pegarNome(BuildContext context) async{
    var bloc = Provider.of<UserBloc>(context);
    var user = await bloc.getUsuario();
    return user.name;
  }
}