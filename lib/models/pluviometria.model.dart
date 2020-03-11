class Pluviometria {
  var id;
  var data;
  var hora;
  var lamina;
  var user_id;
  var pluviometro_id;

  Pluviometria(
      {this.id, this.data, this.hora, this.lamina, this.user_id, this.pluviometro_id});

  Pluviometria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    hora = json['hora'];
    lamina = json['lamina'];
    user_id = json['user_id'];
    pluviometro_id = json['pluviometro_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['hora'] = this.hora;
    data['lamina'] = this.lamina;
    data['user_id'] = this.user_id;
    data['pluviometro_id'] = this.pluviometro_id;
    return data;
  }
}