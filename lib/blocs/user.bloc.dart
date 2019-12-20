import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:rectec_app/models/contaUser.model.dart';
import 'package:rectec_app/models/user.model.dart';
import 'package:rectec_app/repository/user.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../settings.dart';

class UserBloc extends ChangeNotifier{
  User user = new User();
  var usuarios = new List<User>();
  final usuarioRepositorio = new UserRepository();
  
  UserBloc() {
    user = null;
    carregarUsuario();
    getAll();
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

  Future carregarUsuario() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString("user");
    if (userData != null) {
      var res = User.fromJson(jsonDecode(userData));
      Settings.user = res;
      user = res;
    }
  }

  // getUsuario() pega o usuário que está logado
  Future<User> getUsuario() async {
    User user = await UserRepository().getUsuario();
    return user;
  }

  Future<User> getUsuarioById(int id) async {
    User user = await UserRepository().getUsuarioById(id);
    return user;
  }

  getAll() async {
    usuarioRepositorio.getAll().then((data) {
      this.usuarios = data;
      notifyListeners();
    });
  }
}