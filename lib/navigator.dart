import 'package:chat_gpt/authentication/authentication_state.dart';
import 'package:chat_gpt/authentication/login_page.dart';
import 'package:chat_gpt/authentication/registeration_page.dart';
import 'package:chat_gpt/home_page.dart';

import 'main.dart';

final navigator = Navigation();

class Navigation {
  GlobalKey<NavigatorState> get key => navigator.navigatorKey;
  final pageRM = RM.inject<Widget>(() => LoginPage());
  Widget get page => pageRM.state;
  final navigator = RM.navigate;
  Future<T?> to<T extends Object?>(
    Widget page, {
    String? name,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) {
    pageRM.state = page;
    return navigator.to(
      page,
      name: name,
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
    );
  }

  void back<T extends Object>([T? result]) {
    pageRM.state = page;
    return navigator.back(result);
  }

  late final dialog = navigator.toDialog;
  void authentication(AuthenticationState authentication) {
    if (authentication.isAuthenticated) {
      pageRM.state = HomePage();
      navigator.toAndRemoveUntil(HomePage());
    } else {
      if (page is LoginPage) {
        pageRM.state = RegisterationPage();
        navigator.toAndRemoveUntil(RegisterationPage());
      } else {
        pageRM.state = LoginPage();
        navigator.toAndRemoveUntil(LoginPage());
      }
    }
  }
}
