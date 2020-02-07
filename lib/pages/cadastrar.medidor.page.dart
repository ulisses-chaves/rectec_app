import 'package:flutter/material.dart';
import 'package:rectec_app/pages/menu.bar.dart';

class CadastrarMedidorPage extends StatefulWidget {
  @override
  _CadastrarMedidorPageState createState() => _CadastrarMedidorPageState();
}

class _CadastrarMedidorPageState extends State<CadastrarMedidorPage> {
  final _cadastrarMedidorKey = GlobalKey<FormState>();
  String perfilDropdownValue = 'Administrador';
  String profissaoDropdownValue = 'Professor';
  var nome = '';
  var cpf = '';
  var email = '';
  var endereco = '';
  var senha = '';
  var confirmarSenha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastrar Medidor",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      drawer: MenuBar(),
      body: Container(
        color: Colors.blueGrey[50],
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: Form(
          key: _cadastrarMedidorKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                ),
                validator: (value) {
                  var idx = value.indexOf(' ');
                  if (value.isEmpty) return 'Preencha esse campo';
                  if (idx == -1) return 'Sobrenome é necessário';
                  return null;
                },
                onSaved: (val) {
                  var finalVal = val.replaceFirst(val.substring(0, 1), val.substring(0, 1).toUpperCase());
                  nome = finalVal;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "CPF",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Preencha esse campo';
                  if (value.indexOf(' ') != -1 || value.indexOf('-') != -1 || value.indexOf(',') != -1 || value.indexOf('.') != -1) {
                    return 'Apenas números';
                  }
                  if (value.length != 11) return 'CPF deve conter 11 dígitos';
                  return null;
                },
                onSaved: (val) {
                  cpf = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Preencha esse campo';
                  if (value.indexOf('@') == -1 || value.indexOf(' ') != -1) return 'Email inválido';
                  return null;
                },
                onSaved: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Endereço",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Preencha esse campo';
                  return null;
                },
                onSaved: (val) {
                  endereco = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              DropdownButton(
                value: perfilDropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                underline: Container(
                  color: Colors.black38,
                  height: 1,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    perfilDropdownValue = newValue;
                  });
                },
                items: <String>['Administrador', 'Registrador']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Profissão",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              DropdownButton(
                value: profissaoDropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                underline: Container(
                  color: Colors.black38,
                  height: 1,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    profissaoDropdownValue = newValue;
                  });
                },
                items: <String>['Professor', 'Aluno', 'Engenheiro', 'Agricultor', 'Outro']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Preencha esse campo';
                  if (value.length < 5) return 'Senha pequena';
                  return null;
                },
                onSaved: (val) {
                  senha = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(
                  fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: "Confirmar Senha",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  contentPadding: EdgeInsets.all(4)
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Preencha esse campo';
                  if (value.length < 5) return 'Senha Pequena';
                  return null;
                },
                onSaved: (val) {
                  confirmarSenha = val;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(5)
                )
              ),
                child: FlatButton(
                  child: Text(
                    "Cadastrar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if(_cadastrarMedidorKey.currentState.validate()) {
                      _cadastrarMedidorKey.currentState.save();
                      cadastrar(context);
                    }
                  },
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
  cadastrar (BuildContext context) {
    //TRATAR ERRO SE AS SENHAS N FOREM IGUAIS COM MODAL OU ALGUM OUTRA COISA
  }
}