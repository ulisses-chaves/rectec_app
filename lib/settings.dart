import 'dart:convert';
import 'models/user.model.dart';

class Settings {
  static String apiUrl = "http://app.prae.ufrpe.br/rectec/api/";
  static User user;
  static String username = 'usuarioteste@gmail.com'; 
  static String password = '111111';
  static var basicAuth = {
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$username:$password'))
    };
}