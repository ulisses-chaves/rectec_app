import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometria/user.bloc.dart';
import 'package:rectec_app/pages/alerta/alerta.conscientizacao.page.dart';
import 'package:rectec_app/pages/alerta/alerta.mapa.page.dart';
import 'package:rectec_app/pages/alerta/alerta.notificacao.page.dart';
import 'package:rectec_app/pages/alerta/alerta.previsao.page.dart';
import 'package:rectec_app/pages/tabs.page.dart';

class AlertaMenuBar extends StatefulWidget {
  @override
  _AlertaMenuBarState createState() => _AlertaMenuBarState();
}

class _AlertaMenuBarState extends State<AlertaMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.redAccent
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
            leading: Icon(Icons.pin_drop),
            title: Text(
              "Mapa",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            //selected: true,
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MapaPage()), (Route<dynamic> route) => false);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.cloud),
            title: Text(
              "Previsão",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => PrevisaoPage()), (Route<dynamic> route) => false);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text(
              "Notificação",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NotificacaoPage()), (Route<dynamic> route) => false);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.sentiment_satisfied),
            title: Text(
              "Conscientização",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 19,
              ),
            ),
            onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ConscientizacaoPage()), (Route<dynamic> route) => false);
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