class Pluviometro {
  String pluviometroId;
  String dataInstalacao;
  String latitude;
  String longitude;
  String modeloId;

  Pluviometro(
      {this.pluviometroId,
      this.dataInstalacao,
      this.latitude,
      this.longitude,
      this.modeloId});

  Pluviometro.fromJson(Map<String, dynamic> json) {
    pluviometroId = json['pluviometroId'];
    dataInstalacao = json['data_instalacao'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    modeloId = json['modelo_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pluviometroId'] = this.pluviometroId;
    data['data_instalacao'] = this.dataInstalacao;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['modelo_id'] = this.modeloId;
    return data;
  }
}