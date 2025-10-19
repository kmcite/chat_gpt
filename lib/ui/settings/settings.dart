import 'package:chat_gpt/domain/apis/authentication.dart';
import 'package:chat_gpt/domain/apis/navigator.dart';
import 'package:chat_gpt/main.dart';
import 'package:chat_gpt/ui/login.dart';
import 'package:chat_gpt/ui/settings/voice_and_language.dart';
import 'package:chat_gpt/ui/settings/ui.dart';
import 'package:forui/forui.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late final authenticationRepository = watch<AuthenticationRepository>();

  void logout() {
    authenticationRepository.logout();
    navigator.toAndRemoveUntil(LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: 'Settings'.text(),
        prefixes: [
          FButton.icon(onPress: navigator.back, child: Icon(FIcons.arrowLeft)),
        ],
        suffixes: [FButton.icon(onPress: logout, child: Icon(FIcons.logOut))],
      ),
      child: ListView(
        children: [
          // const UserCard(),
          // const AccountSection(),
          AppSection(),
          const VoiceAndLanguageView(),
          FButton(
            onPress: () => logout(),
            prefix: Icon(FIcons.logOut),
            child: 'Sign Out'.text(),
          ),
        ],
      ),
    );
  }
}
