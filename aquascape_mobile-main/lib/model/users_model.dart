class users_model {
  String? balance;
  String? picture;
  int? age;
  String? name;
  String? gender;
  String? company;
  String? email;

  users_model(
      {this.balance,
      this.picture,
      this.age,
      this.name,
      this.gender,
      this.company,
      this.email});

  users_model.fromJson(Map<String, dynamic> json) {
    balance = json['balance'] as String;
    picture = json['picture'] as String;
    age = json['age'] as int;
    name = json['name'] as String;
    gender = json['gender'] as String;
    company = json['company'] as String;
    email = json['email'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['picture'] = this.picture;
    data['age'] = this.age;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['company'] = this.company;
    data['email'] = this.email;
    return data;
  }
}
