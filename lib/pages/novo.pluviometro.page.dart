import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/modelo.bloc.dart';
import 'package:rectec_app/blocs/pluviometro.bloc.dart';
import 'package:rectec_app/models/modelo.model.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class NovoPluviometroPage extends StatefulWidget {
  @override
  _NovoPluviometroPageState createState() => _NovoPluviometroPageState();
}

class _NovoPluviometroPageState extends State<NovoPluviometroPage> {

  final _novoPluviometroKey = GlobalKey<FormState>();
  String dropdownValueModelo = 'manual-las-pet-01';
  static DateFormat dateFormat = DateFormat("yyyy-MM-dd"); 
  var dateNow = dateFormat.format(DateTime.now()); 

  var nome = '';
  var modelo = 'manual-las-pet-01';
  var latitude = '';
  var longitude = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Novo Pluviômetro",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )
      ),
      drawer: MenuBar(),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
          ),
          child: Form(
            key: _novoPluviometroKey,
            child: ListView(
              children: <Widget>[
                Text(
                  "Nome",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                    height: 10,
                  ),
                TextFormField(
                  style: TextStyle(
                    fontSize: 16
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: 5,
                    ),
                  ),
                  validator: (value) {
                    if(value.isEmpty) return "Preencha esse campo";
                    return null;
                  },
                  onSaved: (val) {
                    nome = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Data de instalação",
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
                  "Modelo",
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
                        value: dropdownValueModelo,
                        icon: Icon(Icons.arrow_drop_down),
                        underline: Container(
                          color: Colors.black38,
                          height: 1,
                        ),
                        onChanged: (data) {
                          modelo = data;
                          setState(() {
                            dropdownValueModelo = data;
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
                  future: getModelos(context),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Latitude",
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
                    if (value.isEmpty) return 'Preencha esse campo';
                    if (value.indexOf(' ') != -1 || value.indexOf(',') != -1) return "Use '.' e não use espaços";
                    return null;
                  },
                  onSaved: (value) {
                    latitude = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Longitude",
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
                    if (value.isEmpty) return 'Preencha esse campo';
                    if (value.indexOf(' ') != -1 || value.indexOf(',') != -1) return "Use '.' e não use espaços";
                    return null;
                  },
                  onSaved: (value) {
                    longitude = value;
                  },
                ),
                SizedBox(
                  height: 50,
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
                      if (_novoPluviometroKey.currentState.validate()) {
                        _novoPluviometroKey.currentState.save();
                        cadastrarPluviometro(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<String>> getModelos(BuildContext context) async {
    var bloc = Provider.of<ModeloBloc>(context);
    List<Modelo> modelos = bloc.modelos;
    List<String> listaNomesModelos = new List<String> ();
    for(var i = 0; i <modelos.length; i++) {
      listaNomesModelos.add(modelos[i].tipo);
    }
    return listaNomesModelos;
  }

  cadastrarPluviometro(BuildContext context) async{
    var bloc = Provider.of<PluviometroBloc>(context);
    var resposta = await bloc.addPluviometro(nome, dateNow, modelo, latitude, longitude, context);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(resposta.toString()),
        action: SnackBarAction(
          label: 'OK', onPressed: Scaffold.of(context).hideCurrentSnackBar
        ),
      ),
    );
  }
}