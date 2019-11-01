class Pluviometria {
  String data;
  String hora;
  String lamina;
  String userId;
  String pluviometroId;

  Pluviometria(
      {this.data, this.hora, this.lamina, this.userId, this.pluviometroId});

  Pluviometria.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    hora = json['hora'];
    lamina = json['lamina'];
    userId = json['user_id'];
    pluviometroId = json['pluviometro_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['hora'] = this.hora;
    data['lamina'] = this.lamina;
    data['user_id'] = this.userId;
    data['pluviometro_id'] = this.pluviometroId;
    return data;
  }
}