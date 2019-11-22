import 'package:flutter/cupertino.dart';
import 'package:rectec_app/models/pluviometro.model.dart';
import 'package:rectec_app/repository/pluviometro.repository.dart';

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
}