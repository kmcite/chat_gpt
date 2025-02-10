import 'package:chat_gpt/authentication/authentication_bloc.dart';
import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

class RegisterationPage extends UI {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'Registeration Page'.text(),
      ),
      content: Column(
        children: [
          FTextField(
            label: 'Name'.text(),
            initialValue: authenticationRM.authentication.name,
            onChange: (value) => authenticationRM.name(value),
          ),
          FTextField.email(
            initialValue: authenticationRM.authentication.email,
            onChange: (value) => authenticationRM.email(value),
          ),
          FTextField.password(
            initialValue: authenticationRM.authentication.password,
            onChange: (value) => authenticationRM.password(value),
          ),
          FButton(
            onPress: authenticationRM.register,
            label: 'Register'.text(),
          ).center().pad(),
        ],
      ),
    );
  }
}
