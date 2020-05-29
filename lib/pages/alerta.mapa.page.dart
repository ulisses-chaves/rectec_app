import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:rectec_app/pages/alerta.menu.dart';

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
          minZoom: 10.0
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
          )
        ],
      ),
    );
  }
}