import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
    UserModel({
        required this.userId,
        required this.username,
        required this.email,
        required this.password,
        required this.image,
        required this.createAt,
        required this.updateAt,
    });

    final String userId;
    final String username;
    final String email;
    final String password;
    final String image;
    final DateTime createAt;
    final DateTime updateAt;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        image: json["image"],
        createAt: (json["create_at"] as Timestamp).toDate(),
        updateAt: (json["update_at"] as Timestamp).toDate(),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "email": email,
        "password": password,
        "image": image,
        "create_at": createAt,
        "update_at": updateAt,
    };
}