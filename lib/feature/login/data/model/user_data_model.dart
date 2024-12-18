class UserDataModel {
  final String name;
  final String email;
  final String phone;
  final String uId;
  final String image;
  final String cover;
  final String bio;
  final bool isEmailVerified;

  UserDataModel({
    required this.image,
    required this.cover,
    required this.bio,
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
      image: json['image'],
      cover: json['cover'],
      bio: json['bio'],
      isEmailVerified: json['isEmailVerified'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
      'cover': cover,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}
