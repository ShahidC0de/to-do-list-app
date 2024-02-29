class UserModel {
  final String userId;
  final String name;
  final String email;
  UserModel({required this.name, required this.email, required this.userId});
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'], name: json['name'], userId: json['userId']);
  }
}
