import 'package:chat_gpt/domain/apis/authentication.dart';
import 'package:chat_gpt/domain/apis/navigator.dart';
import 'package:chat_gpt/main.dart';
import 'package:chat_gpt/ui/home/home.dart';
import 'package:forui/forui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthenticationRepository authenticationRepository = watch();

  bool get authenticated => authenticationRepository.authenticated;

  void onLoggedIn() {
    authenticationRepository.login('test');
    navigator.to(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: 'Login'.text()),
      child: Column(
        children: [
          FTextField.email(
            // initialValue: authenticationRM.authentication.email,
            // onChange: (value) => authenticationRM.email(value),
          ),
          FTextField.password(
            // initialValue: authenticationRM.authentication.password,
            // onChange: (value) => authenticationRM.password(value),
          ),
          FButton(onPress: onLoggedIn, child: 'Login'.text()).pad(),
        ],
      ),
    );
  }
}
