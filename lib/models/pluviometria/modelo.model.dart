class Modelo {
  String tipo;
  String descricao;

  Modelo({this.tipo, this.descricao});

  Modelo.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    return data;
  }
}