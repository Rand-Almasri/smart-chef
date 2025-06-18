class UserModel {
  String? name;
  String email;
  String password;
  int? age;
  String? gender;

  UserModel({
    this.name,
    required this.email,
    required this.password,
    this.age,
    this.gender,
  });
}
