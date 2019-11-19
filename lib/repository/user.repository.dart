import 'package:dio/dio.dart';
import 'package:rectec_app/models/contaUser.model.dart';
import 'package:rectec_app/models/user.model.dart';
import 'package:rectec_app/settings.dart';

class UserRepository {
  Future<User> autenticar(ContaUser conta) async {
    var url = "${Settings.apiUrl}login";
    Response response = await Dio().post(url, data: conta);
    return User.fromJson(response.data);
  }

  Future<User> getUsuario() async {
    var url = "${Settings.apiUrl}user/${Settings.user.id}";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: Settings.basicAuth
      ),
    );
    return User.fromJson(response.data);
  }
}