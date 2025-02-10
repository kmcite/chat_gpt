import 'package:chat_gpt/authentication/authentication_state.dart';
import 'package:chat_gpt/users/user.dart';
import 'package:chat_gpt/main.dart';
import 'package:chat_gpt/users/users.dart';

final authenticationRM = AuthenticationBloc();

class AuthenticationBloc {
  final authenticationRM = RM.inject<AuthenticationState>(
    () => AuthenticationState(),
  );
  AuthenticationState get authentication => authenticationRM.state;
  set authentication(AuthenticationState value) {
    authenticationRM
      ..state = value
      ..notify();
  }

  final userRM = RM.inject<User?>(() => null);
  set safeUser(User? user) {
    userRM
      ..state = user
      ..notify();
  }

  User? get safeUser => userRM.state;
  bool get isAuthenticated => authentication.isAuthenticated;

  void login() {
    final user = usersRepository.login(
      authentication.email,
      authentication.password,
    );
    authentication = authentication..id = user?.id;
    navigator.authentication(authentication);
  }

  void register() {
    final isEmailPresent = usersRepository.isEmailPresent(authentication.email);
    if (!isEmailPresent) {
      final user = User()
        ..name = authentication.name
        ..email = authentication.email
        ..password = authentication.password;
      usersRepository.put(user);
    }
    login();
    navigator.authentication(authentication);
  }

  void logout() {
    authentication = authentication..id = null;
    navigator.authentication(authentication);
  }

  /// login & register
  void name(String value) {
    authentication = authentication..name = value;
  }

  void email(String value) {
    authentication = authentication..email = value;
  }

  void password(String value) {
    authentication = authentication..password = value;
  }
}
