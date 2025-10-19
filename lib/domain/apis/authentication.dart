import 'dart:async';

import 'package:chat_gpt/utils/repository.dart';

class Authentication {
  String? id;
  String userName = 'Adn';
}

class AuthenticationRepository extends Repository<Authentication> {
  @override
  FutureOr<void> init() {
    update(Authentication());
  }

  void login(String id) {
    update(Authentication()..id = id);
  }

  void logout() => update(Authentication());

  bool get authenticated => value.id != null;
}
