import 'package:flutter/material.dart';
import 'package:rectec_app/pages/alerta.mapa.dart';
import 'package:rectec_app/pages/login.page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          LoginPage(),
          MapaPage()
        ]
      ),
      bottomNavigationBar: new TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.cloud,
              color: Theme.of(context).primaryColor,
            ),
           child: Text(
              "Pluviometria",
              style: TextStyle(
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.error, 
              color: Colors.redAccent
            ),
            child: Text(
              "Alerta de alagamentos",
              style: TextStyle(
                color: Colors.redAccent
              ),
            ),
          )
        ],
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.black38,
      ),
    );
  }
}