import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/modelo.bloc.dart';
import 'package:rectec_app/models/modelo.model.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class NovoPluviometroPage extends StatefulWidget {
  @override
  _NovoPluviometroPageState createState() => _NovoPluviometroPageState();
}

class _NovoPluviometroPageState extends State<NovoPluviometroPage> {

  String dropdownValueModelo = 'manual-las-pet-01';
  static DateFormat dateFormat = DateFormat("dd-MM-yyyy"); 
  String dateNow = dateFormat.format(DateTime.now()); 

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
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
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
            TextFormField(
              showCursor: true, 
              readOnly: true, 
              initialValue: dateNow,
              style: TextStyle(
                fontSize: 16
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  bottom: 5,
                ),
              ),
              onTap: () async {
                var dtPicker = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1940),
                  lastDate: DateTime(2099));
                if(dtPicker != null) {
                  setState(() {
                    dtPicker = dateFormat.parse(dtPicker.toString());
                    print(dtPicker);
                    dateNow = dtPicker.toString();
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
                onPressed: () {},
              ),
            ),
          ],
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
}