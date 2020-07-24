import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometria/user.bloc.dart';
import 'package:rectec_app/pages/pluviometria/cadastrar.medidor.page.dart';
import 'package:rectec_app/pages/pluviometria/configurar.medidor.page.dart';
import 'package:rectec_app/pages/pluviometria/historico.page.dart';
import 'package:rectec_app/pages/pluviometria/login.page.dart';
import 'package:rectec_app/pages/pluviometria/novo.pluviometro.page.dart';
import 'package:rectec_app/pages/pluviometria/pluviometria.page.dart';
import 'package:rectec_app/pages/tabs.page.dart';

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
            //selected: true,
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => PluviometriaPage()), (Route<dynamic> route) => false);
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
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CadastrarMedidorPage()), (Route<dynamic> route) => false);
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
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ConfigurarMedidorPage()), (Route<dynamic> route) => false);
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
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => NovoPluviometroPage()), (Route<dynamic> route) => false);
            },
          ),
          /*Divider(),
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
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HistoricoPage()), (Route<dynamic> route) => false);
            },
          ),*/
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
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DefaultTabController(length: 2, child: TabsPage())), (Route<dynamic> route) => false);
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