import 'package:flutter/material.dart';
import 'package:rectec_app/pages/cadastrar.medidor.page.dart';
import 'package:rectec_app/pages/configurar.medidor.page.dart';
import 'package:rectec_app/pages/novo.pluviometro.page.dart';
import 'package:rectec_app/pages/pluviometria.page.dart';

class MenuBar extends StatelessWidget {
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
                  Text(
                    "Bem vindo, Ulisses",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )
                  )
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
            onTap: (){
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => PluviometriaPage()));
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => PluviometriaPage()));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}