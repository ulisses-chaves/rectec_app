import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rectec_app/models/pluviometria.model.dart';
import 'package:rectec_app/settings.dart';

class PluviometriaRepository {
  Future<List<Pluviometria>> getAll () async {
    var url = Settings.apiUrl + "pluviometria/";
    String username = 'ulisseschaves8@gmail.com'; 
    String password = 'franguli'; 
    final basicAuth = {
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$username:$password'))
    };
    Response response = await Dio().get(
      url,
      options: Options(
        headers: basicAuth
      )
      );  
    return (response.data as List).map((item) => Pluviometria.fromJson(item)).toList();
  }
}