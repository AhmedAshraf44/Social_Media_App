class UserDataModel {
  final String name;
  final String email;
  final String phone;
  final String uId;
  final bool isEmailVerified;

  UserDataModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.isEmailVerified,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      uId: json['uId'],
      isEmailVerified: json['isEmailVerified'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
