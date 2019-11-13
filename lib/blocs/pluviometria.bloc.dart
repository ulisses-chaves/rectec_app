import 'package:flutter/cupertino.dart';
import 'package:rectec_app/models/pluviometria.model.dart';
import 'package:rectec_app/repository/pluviometria.repository.dart';

class PluviometriaBloc extends ChangeNotifier{
  final pluviometriaRepositorio = new PluviometriaRepository();
  var pluviometrias = new List<Pluviometria>();

  PluviometriaBloc() {
    getPluviometrias();
  }

  getPluviometrias() {
    pluviometriaRepositorio.getAll().then((data) {
      this.pluviometrias = data;
      notifyListeners();
    });
  }
}