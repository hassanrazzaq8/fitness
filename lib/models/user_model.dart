class User {
  final String? uid;
  final String? email;
  final String? password;
  final String? age;
  final String? contact;
  final String? weight;

  User(
      {this.uid,
      this.email,
      this.password,
      this.age,
      this.contact,
      this.weight});
  Map<String, dynamic> tojson() => {
        "uid": uid,
        "email": email,
        "password": password,
        "age": age,
        "contact": contact,
        "weight": weight,
      };
}
