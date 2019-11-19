class User {
  var id;
  String cpf;
  String name;
  String endereco;
  String email;
  String password;
  var idProfissao;
  var idPerfil;

  User(
      {this.id,
      this.cpf,
      this.name,
      this.endereco,
      this.email,
      this.password,
      this.idProfissao,
      this.idPerfil});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cpf = json['cpf'];
    name = json['name'];
    endereco = json['endereco'];
    email = json['email'];
    password = json['password'];
    idProfissao = json['id_profissao'];
    idPerfil = json['id_perfil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cpf'] = this.cpf;
    data['name'] = this.name;
    data['endereco'] = this.endereco;
    data['email'] = this.email;
    data['password'] = this.password;
    data['id_profissao'] = this.idProfissao;
    data['id_perfil'] = this.idPerfil;
    return data;
  }
}