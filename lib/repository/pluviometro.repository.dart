import 'package:dio/dio.dart';
import 'package:rectec_app/models/pluviometro.model.dart';
import 'package:rectec_app/settings.dart';

class PluviometroRepository {
  Future<List<Pluviometro>> getAll () async{
    var url = Settings.apiUrl + "pluviometro/";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: Settings.basicAuth,
      )
    );
    return (response.data as List).map((item) => Pluviometro.fromJson(item)).toList();
  }
}
