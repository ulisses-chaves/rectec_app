import 'dart:convert';
import 'models/user.model.dart';

class Settings {
  static String apiUrl = "";
  static User user;
  static String username = ''; 
  static String password = '';
  static var basicAuth = {
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$username:$password'))
    };
}