import 'package:chat_gpt/domain/models/random_id.dart';

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
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
