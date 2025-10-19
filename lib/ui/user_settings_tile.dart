import 'package:chat_gpt/domain/apis/configuration_repository.dart';
import 'package:chat_gpt/domain/apis/navigator.dart';
import 'package:chat_gpt/main.dart';
import 'package:chat_gpt/ui/settings/settings.dart';

class UserSettingsTile extends StatefulWidget {
  const UserSettingsTile({super.key});

  @override
  State<UserSettingsTile> createState() => _UserSettingsTileState();
}

class _UserSettingsTileState extends State<UserSettingsTile> {
  late ConfigurationRepository configurationRepository = watch();

  String get userName => configurationRepository().userName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        navigator.to(SettingsView());
      },
      leading: const CircleAvatar(
        child: Icon(
          Icons.supervised_user_circle,
        ),
      ),
      title: userName.text(),
      subtitle: 'tap to open settings'.text(),
      trailing: CircleAvatar(
        child: const Icon(Icons.settings),
      ),
    );
  }
}
