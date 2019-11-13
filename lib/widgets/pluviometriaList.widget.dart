/*import 'package:flutter/material.dart';
import 'package:rectec_app/models/pluviometria.model.dart';
import 'package:rectec_app/widgets/pluviometriaCard.widgets.dart';

class PluviometriaList extends StatelessWidget {
  final List<Pluviometria> pluviometrias;
  
  PluviometriaList({
      @required this.pluviometrias
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pluviometrias.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: PluviometriaCard(
              //item: pluviometrias[index],
            ),
          );
        },
      ),
    );
  }
}*/