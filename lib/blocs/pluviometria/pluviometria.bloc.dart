import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometria/pluviometro.bloc.dart';
import 'package:rectec_app/models/pluviometria/pluviometria.model.dart';
import 'package:rectec_app/models/pluviometria/pluviometro.model.dart';
import 'package:rectec_app/models/pluviometria/user.model.dart';
import 'package:rectec_app/repository/pluviometria/pluviometria.repository.dart';
import 'user.bloc.dart';

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

  Future addPluviometria(var pluviometro, var data, var hora, var lamina, BuildContext context) async {
    //pegando o usuario logado
    var bloc = Provider.of<UserBloc>(context);
    User userLogado = await bloc.getUsuario();
    var userId = userLogado.id;
    
    //pegando o id do pluviometro usado na pluviometria
    var pluviometroId = -1;
    var blocPluv = Provider.of<PluviometroBloc>(context);
    List<Pluviometro> pluviometros = blocPluv.pluviometros;
    for (var i = 0; i < pluviometros.length; ++i){
      if(pluviometros[i].nome == pluviometro) pluviometroId = pluviometros[i].id; 
    }
    data = data + ":00";
    //TESTAR QUANDO FOR FAZER A PLUVIOMETRIA LA NA PRAE
    Pluviometria pluviometria = Pluviometria (pluviometro_id: pluviometroId, data: data, hora: hora, lamina: lamina, user_id: userId);
    try {
        var repository = new PluviometriaRepository();
        var resposta = await repository.addPluviometria(pluviometria);
        return resposta;
    } catch (ex) {
        return ex;
    }
  }





  /*Future<Pluviometria> getPluviometriaById(int id) async{
    Pluviometria pluviometria = await PluviometriaRepository().getPluviometriaById(id);
    return pluviometria;
  }*/
}