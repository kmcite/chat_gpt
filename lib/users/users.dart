import 'package:chat_gpt/main.dart';

import 'user.dart';

final usersRepository = UsersRepository(
  'users',
  fromJson: User.fromJson,
);

class UsersRepository extends RMC<User> {
  UsersRepository(super.tag, {required super.fromJson});
  User? login(String email, String password) {
    return getAll().where(
      (user) {
        return user.email == email;
      },
    ).where(
      (user) {
        return user.password == password;
      },
    ).firstOrNull;
  }

  bool isEmailPresent(String email) {
    return getAll().any(
      (user) {
        return user.email == email;
      },
    );
  }
}
