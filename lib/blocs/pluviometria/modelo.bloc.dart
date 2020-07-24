import 'package:flutter/cupertino.dart';
import 'package:rectec_app/models/pluviometria/modelo.model.dart';
import 'package:rectec_app/repository/pluviometria/modelo.repository.dart';

class ModeloBloc extends ChangeNotifier{
  //Modelo modelo = new Modelo();
  var modelos = new List<Modelo>();
  final modeloRepositorio = new ModeloRepository();

  ModeloBloc(){
    getModelos();
  }

  getModelos() {
    modeloRepositorio.getAll().then((data) {
      this.modelos = data;
      notifyListeners();
    }); 
  }
}