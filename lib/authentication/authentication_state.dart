class AuthenticationState {
  String? id;
  bool get isAuthenticated => id != null;
  String name = '';
  String email = '';
  String password = '';

  AuthenticationState();
}
