import 'package:dio/dio.dart';
import 'package:rectec_app/models/pluviometria/pluviometria.model.dart';
import 'package:rectec_app/settings.dart';

class PluviometriaRepository {
  Future<List<Pluviometria>> getAll() async {
    var url = Settings.apiUrl + "pluviometria/";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: Settings.basicAuth
      )
    );
    return (response.data as List).map((item) => Pluviometria.fromJson(item)).toList();
  }

  Future addPluviometria(Pluviometria pluviometria) async {
    var url = "${Settings.apiUrl}pluviometria";
    Response response = await Dio().post(
      url,
      data: pluviometria,
      options: Options(
        headers: Settings.basicAuth
      )
    );
    return response;
  }

  /*Future<Pluviometria> getPluviometriaById(int id) async {
    var url = Settings.apiUrl + "pluviometria/$id";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: Settings.basicAuth
      )
    );
  }*/
}