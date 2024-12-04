class UserDataModel {
  final String name;
  final String email;
  final String phone;
  final String uId;

  UserDataModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.uId});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      uId: json['uId'],
    );
  }
}
