//AJEITAR O DATE PICKER E TESTAR SALVAR A PLUVIOMETRIA


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometria/pluviometria.bloc.dart';
import 'package:rectec_app/blocs/pluviometria/pluviometro.bloc.dart';
import 'package:rectec_app/models/pluviometria/pluviometro.model.dart';
import 'package:rectec_app/pages/pluviometria/menu.bar.dart';

class PluviometriaPage extends StatefulWidget {
  @override
  _PluviometriaPageState createState() => _PluviometriaPageState();
}

class _PluviometriaPageState extends State<PluviometriaPage> {
  final _pluviometriaKey = GlobalKey<FormState>();
  String dropdownValue = '2018-prae-01';
  static DateFormat dateFormat = DateFormat("yyyy-MM-dd"); 
  var dateNow = dateFormat.format(DateTime.now());
  var hourNow = TimeOfDay.now().toString().substring(10, 15);
  var pluviometro = '2018-prae-01';
  var lamina = '';

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
      body: Builder(
        builder: (context) => Container(
          color: Colors.blueGrey[50],
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Form(
            key: _pluviometriaKey,
            child: ListView(
              children: <Widget>[
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
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        underline: Container(
                          color: Colors.black38,
                          height: 1,
                        ),
                        onChanged: (data) {
                          pluviometro = data;
                          setState(() {
                            dropdownValue = data;
                          });
                        },
                        items: snapshot.data.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String> (
                            value: value,
                            child: Container(
                              width: 250,
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      );
                    } else return Text("${snapshot.error}");
                  },
                  future: getPluviometros(context),
                ),
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
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today, 
                        color: Colors.blue,
                      ),
                      Text('   '),
                      Text(
                        dateNow,
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                      var dtPicker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime(2099));
                      if(dtPicker != null) {
                        setState(() {
                          dtPicker = dateFormat.parse(dateFormat.format(dtPicker));
                          dateNow = dtPicker.toString().substring(0, 10);
                        });
                      }
                    },
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
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time, 
                        color: Colors.blue,
                      ),
                      Text('   '),
                      Text(
                        hourNow,
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    TimeOfDay tmPicker = await showTimePicker(
                      context: context, 
                      initialTime: TimeOfDay.now()
                    );
                    if(tmPicker != null) {
                      setState(() {
                        hourNow = tmPicker.toString().substring(10, 15);
                      });
                    }
                  },
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
                  validator: (value) {
                    if (value.isEmpty) return "Preencha esse campo";
                    if (value.indexOf(' ') != -1 || value.indexOf(',') != -1 || value.indexOf('-') != -1) return "Use '.', não use '-' e nem espaços";
                    return null;
                  },
                  onSaved: (value) {
                      lamina = value;
                    },
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
                    onPressed: () {
                      if (_pluviometriaKey.currentState.validate()) {
                        _pluviometriaKey.currentState.save();
                        salvarPluviometria(context);
                      }
                    },
                  ),
                ),
              ],
            )
          )
        ),
      )
    );
  }

  Future<List<String>> getPluviometros(BuildContext context) async {
    var bloc = Provider.of<PluviometroBloc>(context);
    List<Pluviometro> pluviometros = bloc.pluviometros;
    List<String> listaNomesPluviometros = new List<String> ();
    for(var i = 0; i <pluviometros.length; i++) {
      listaNomesPluviometros.add(pluviometros[i].nome);
    }
    return listaNomesPluviometros;
  }
  salvarPluviometria(BuildContext context) async {
    var bloc = Provider.of<PluviometriaBloc>(context);
    var resposta = await bloc.addPluviometria(pluviometro, dateNow, hourNow, lamina, context);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(resposta.toString()),
        action: SnackBarAction(
          label: 'OK', onPressed: Scaffold.of(context).hideCurrentSnackBar
        ),
      )
    );
  }
}