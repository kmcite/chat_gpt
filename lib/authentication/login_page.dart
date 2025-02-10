import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

import 'authentication_bloc.dart';

class LoginPage extends UI {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'Login'.text(),
      ),
      content: Column(
        children: [
          FTextField.email(
            initialValue: authenticationRM.authentication.email,
            onChange: (value) => authenticationRM.email(value),
          ),
          FTextField.password(
            initialValue: authenticationRM.authentication.password,
            onChange: (value) => authenticationRM.password(value),
          ),
          FButton(
            onPress: authenticationRM.login,
            label: 'Login'.text(),
          ).center().pad(),
        ],
      ),
    );
  }
}
