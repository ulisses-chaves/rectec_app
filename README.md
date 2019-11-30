# RecTecApp
## Aplicativo da Rede Colaborativa de Tempo e Clima

### Pré-requisitos para rodar o Flutter

* Extensão do Dart instalada (recomendo instalar pelo Visual Studio Code)
* Flutter instalado com variável de ambiente (não siga a etapa do "Android Setup" se não for usar o Android Studio)<br>
https://flutter.dev/docs/get-started/install

### Etapas após o clone

* Rodar localmente a API para esse app poder consumir: https://github.com/CiceroPereira/RecTec
* Na pasta 'lib' do projeto crie um arquivo com o nome 'settings.dart' e cole isso nele:
```bash
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
```
* No campo 'apiUrl' coloque a url da api local e nos campos 'username' e 'password' coloque um usuario encontrado nas migrations da API (o código apartir da linha do 'username' é apenas para teste, em breve será retirado)

#### Comandos necessários na raiz do projeto para rodar
```bash
> flutter packages get
> flutter run
```
