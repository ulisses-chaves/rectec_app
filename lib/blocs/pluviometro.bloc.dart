import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/models/modelo.model.dart';
import 'package:rectec_app/models/pluviometro.model.dart';
import 'package:rectec_app/repository/pluviometro.repository.dart';
import 'modelo.bloc.dart';

class PluviometroBloc extends ChangeNotifier{
  final pluviometroRepositorio = new PluviometroRepository();
  var pluviometros = new List<Pluviometro>();

  PluviometroBloc() {
    getPluviometros();
  }

  getPluviometros() {
    pluviometroRepositorio.getAll().then((data) {
      this.pluviometros = data;
      notifyListeners();
    });
  }

  Future addPluviometro(var nome, var data, var modelo, var lat, var long, BuildContext context) async{
    var tipo = -1;
    var bloc = Provider.of<ModeloBloc>(context);
    List<Modelo> modelos = bloc.modelos;
    for(var i = 0; i <modelos.length; i++) {
      if(modelos[i].tipo == modelo) tipo = i;
    }
    //TESTAR OS IDS DOS MODELOS PRA ADD NO PLUVIOMETRO
    if(tipo != -1) {
      return tipo;
    }
    return 'deu merda';

    //TA TUDO CERTO JÁ SO TIRAR O COMENTARIO
    //NAO TESTAR!!!
    /*if (tipo != -1) {
      Pluviometro pluviometro = new Pluviometro(nome: nome, data: data, latitude: lat, longitude: long);
      try {
        var repository = new PluviometroRepository();
        var resposta = await repository.addPluviometro(pluviometro);
        return resposta;
      } catch (ex) {
        return ex;
      }
    }*/
  }
}