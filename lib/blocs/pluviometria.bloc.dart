import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/models/pluviometria.model.dart';
import 'package:rectec_app/models/user.model.dart';
import 'package:rectec_app/repository/pluviometria.repository.dart';
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

  addPluviometria(var pluviometro, var data, var hora, var lamina, BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context);
    User userLogado = await bloc.getUsuario();
    var userId = userLogado.id; //VERIFICAR SE É ESSE O ID DO USUARIO Q PRECISA PRA CADASTRAR A PLUVIOMETRIA E SE 17 É O MEU MESMO ulisses
                                //VERIFICAR TBM SE PLUVIOMETROiD É O ID OU O NOME MESMO DO PLUVIOMETRO
    lamina = lamina + 'mm';
    //TESTAR QUANDO FOR FAZER A PLUVIOMETRIA LA NA PRAE
    /*Pluviometria pluviometria = Pluviometria (pluviometroId: pluviometro, data: data, hora: hora, lamina: lamina, userId: userId);
    try {
        var repository = new PluviometriaRepository();
        var resposta = await repository.addPluviometria(pluviometria);
        return resposta;
    } catch (ex) {
        return ex;
    }*/
  }





  /*Future<Pluviometria> getPluviometriaById(int id) async{
    Pluviometria pluviometria = await PluviometriaRepository().getPluviometriaById(id);
    return pluviometria;
  }*/
}