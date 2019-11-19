class ContaUser {
  var email;
  var password;
  var id;

  ContaUser({
    this.email,
    this.password,
  });

  ContaUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['id'] = this.id;
    return data;
  }
}