import "package:latlong/latlong.dart";
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:rectec_app/pages/alerta/alerta.menu.dart';

class MapaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Mapa",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      drawer: AlertaMenuBar(),
      body: FlutterMap(
        options: MapOptions(
          onTap: (coordenadas) {
            return showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  title: Text("Adicionar ponto de alagamento?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: Text("Tem certeza que deseja adicionar este ponto de alagamento?"),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text("Não",
                        style: TextStyle(
                          color: Colors.redAccent
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {}, 
                      child: Text("Sim",
                        style: TextStyle(
                          color: Colors.redAccent
                        ),
                      )
                    ),
                  ],
                );
              }
            );
          },
          center: LatLng(-8.05428, -34.8813),
          zoom: 7.0
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(
            markers: [

            ],
          )
        ],
      ),
    );
  }
}