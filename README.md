# RecTecApp
## Aplicativo da Rede Colaborativa de Tempo e Clima

### Pré-requisitos para rodar o Flutter

* Extensão do Dart instalada (recomendo instalar pelo Visual Studio Code)
* Flutter instalado com variável de ambiente (não siga a etapa do "Android Setup" se não for usar o Android Studio)<br>
https://flutter.dev/docs/get-started/install

### Etapas após o clone

* Rodar localmente a API para esse app poder consumir: https://github.com/CiceroPereira/RecTec
* Na pasta 'lib' do projeto abra o arquivo 'settings.dart' e preencha os campos:
```bash
  static String apiUrl = ""; // URL da API local
  static String username = ''; //  Escolha um usuário que pode ser encontrado nas migrations da API
  static String password = ''; // Senha do usuário escolhido
```

#### Comandos necessários na raiz do projeto para rodar
```bash
> flutter packages get
> flutter run
```
