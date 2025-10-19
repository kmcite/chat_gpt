import 'package:chat_gpt/domain/apis/navigator.dart';
import 'package:chat_gpt/main.dart';
import 'package:chat_gpt/ui/login.dart';
import 'package:forui/forui.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  String name = '';

  String email = '';

  String password = '';

  void onNameChanged(String value) {
    name = value;
    notify();
  }

  void onEmailChanged(String value) {
    email = value;
    notify();
  }

  void onPasswordChanged(String value) {
    password = value;
    notify();
  }

  void onRegistered() {
    // Implementation for registration
    // For now, just navigate back to login
    navigator.toAndRemoveUntil(LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: 'Registeration Page'.text()),
      child: Column(
        children: [
          FTextField(label: 'Name'.text(), onChange: onNameChanged),
          FTextField.email(onChange: onEmailChanged),
          FTextField.password(onChange: onPasswordChanged),
          FButton(onPress: onRegistered, child: 'Register'.text()).pad(),
        ],
      ),
    );
  }
}
