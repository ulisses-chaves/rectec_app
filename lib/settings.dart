import 'dart:convert';

class Settings {
  static String apiUrl = "http://app.prae.ufrpe.br/rectec/api/";

  static String username = 'ulisseschaves8@gmail.com'; 
  static String password = 'franguli';
  static var basicAuth = {
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$username:$password'))
    };
}