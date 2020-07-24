class Pluviometro {
  var id;
  var nome;
  var data;
  var latitude;
  var longitude;
  var tipo;

  Pluviometro(
      {this.id,
      this.nome,
      this.data,
      this.latitude,
      this.longitude,
      this.tipo});

  Pluviometro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['pluviometroId'];
    data = json['data_instalacao'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    tipo = json['modelo_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pluviometroId'] = this.nome;
    data['data_instalacao'] = this.data;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['modelo_id'] = this.tipo;
    return data;
  }
}