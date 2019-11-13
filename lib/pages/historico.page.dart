import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometria.bloc.dart';
import 'package:rectec_app/models/pluviometria.model.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class SelecionarHistoricoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histórico",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      drawer: MenuBar(),
      body: Container(
        color: Colors.blueGrey[50],
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Data Origem"
              ),
              onTap: () async {
                final dtPick = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Data Destino"
              ),
              onTap: () async {
                final dtPick = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(5)
                )
              ),
              child: FlatButton(
                child: Text(
                  "Procurar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //if (_formKey.currentState.validate()) {
                  //  _formKey.currentState.save();
                  //}
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoricoPage()));
                },
              ),
            ),  
          ],
        ),
      ),
    );
  }
}

class HistoricoPage extends StatefulWidget {
  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  
  _buildList(PluviometriaBloc pluviometriaBloc) {
    return ListView.builder(
      itemCount: pluviometriaBloc.pluviometrias.length,
      itemBuilder: (context,index) {
        return _buildItems(pluviometriaBloc.pluviometrias[index]);
      },
    );
  }

  _buildItems(Pluviometria pluviometria) {
    var hora = pluviometria.hora;
    var data = pluviometria.data;
    String usuario = pluviometria.userId.toString();
    String lamina = pluviometria.lamina.toString();
    String pluviometro = pluviometria.pluviometroId.toString();
    return ListTile(
      title: Text(
        "$usuario - $pluviometro - $lamina" + "mm"
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histórico",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      drawer: MenuBar(),
      body: Consumer<PluviometriaBloc> (builder: (context, pluviometriaBloc, widget) {
        return _buildList(pluviometriaBloc);
      },),
    );
  }
}