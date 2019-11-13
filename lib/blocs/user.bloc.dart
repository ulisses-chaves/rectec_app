import 'dart:convert';

import 'package:rectec_app/models/contaUser.model.dart';
import 'package:rectec_app/models/user.model.dart';
import 'package:rectec_app/repository/user.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc {
  User user = new User();
  
  UserBloc() {
    user = null;
    //carregarUser();
  }

  Future<User> autenticar(ContaUser conta) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var resposta = await UserRepository().autenticar(conta);
      user = resposta;

      await prefs.setString('user', jsonEncode(resposta));
      return resposta;
    } catch(ex) {
      print(ex);
      user = null;
      return null;
    }
  }

  //Future carregarUser() async {
    //var prefs = await SharedPreferences.getInstance();
    //var userData = prefs.getString("user");
    //if (userData != null) {
      //var res = User
    //}
  //}
}