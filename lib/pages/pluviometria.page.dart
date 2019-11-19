import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometro.bloc.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class PluviometriaPage extends StatefulWidget {
  @override
  _PluviometriaPageState createState() => _PluviometriaPageState();
}

class _PluviometriaPageState extends State<PluviometriaPage> {
  final _pluviometriaKey = GlobalKey<FormState>();
  //DateTime dateNow = DateTime.now(); //vê isso aqui

  String dropdownValue = 'One';
  List<String> spinnerItems = [ 
    'One',  
    'Two',  
    'Three',  
    'Four',  
    'Five'
  ]; 

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Pluviometria",
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
              top: 30,
              left: 20,
              right: 20,
            ),
            child: Form(
              key: _pluviometriaKey, //vê isso aqui
              child: ListView(
                children: <Widget>[
                  /*Text(
                    "Nome",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 14,
                      height: 0.5
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black87,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),*/
                  Text(
                    "Pluviometro",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    underline: Container(
                      color: Colors.black38,
                      height: 1,
                    ),
                    onChanged: (data) {
                      setState(() {
                        dropdownValue = data;
                      });
                    },
                    items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String> (
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  
                  /*TextFormField(
                    style: TextStyle(
                      fontSize: 16
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                  ),*/
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Data",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    style: TextStyle(
                      fontSize: 16
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hora",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    style: TextStyle(
                      fontSize: 16
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Lâmina",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 16
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
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
                        "Salvar",
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
              )
            )
          ),
        );
      }
      //PAREI AQUI!
      Future<List<String>> getPluviometros() async {
        var bloc = Provider.of<PluviometroBloc>(context);
        var pluviometrios = await bloc.getPluviometros();
        List<String> listaNomesPluviometros;
        for (var i = 0; i < pluviometrios.length; i++) {
          listaNomesPluviometros[i] = pluviometrios[i].pluviometroId;
        }
        print(listaNomesPluviometros);
        return listaNomesPluviometros;
      }
}