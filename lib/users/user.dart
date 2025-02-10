import 'package:chat_gpt/main.dart';

class User {
  String id = randomId;
  String name = 'Adnan Farooq';
  String email = '';
  String password = '';
  User();
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    password = json['password'] ?? '';
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
      };
}
