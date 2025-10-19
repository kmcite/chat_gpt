import 'package:chat_gpt/domain/apis/actions_repository.dart';
import 'package:chat_gpt/domain/apis/authentication.dart';
import 'package:chat_gpt/domain/apis/chats_repository.dart';
import 'package:chat_gpt/domain/apis/configuration_repository.dart';
import 'package:chat_gpt/main.dart';
import 'package:chat_gpt/objectbox.g.dart';
import 'package:chat_gpt/ui/login.dart';
import 'package:chat_gpt/ui/home/home.dart';
export 'package:chat_gpt/utils/service_locator.dart';
export 'package:flutter/material.dart' hide State;
import 'package:forui/forui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
export 'package:chat_gpt/utils/extensions.dart';

import 'domain/apis/navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appInfo = await PackageInfo.fromPlatform();
  final path = await getApplicationDocumentsDirectory();
  final store = await openStore(directory: join(path.path, appInfo.appName));

  locator.service(store);
  locator.repository(ConfigurationRepository());
  locator.repository(AuthenticationRepository());
  locator.repository(ChatsRepository());
  locator.repository(MessagesRepository());
  locator.repository(CurrentChatRepository());
  locator.repository(HomeRepository());

  runApp(ChatGptApp());
}

class ChatGptApp extends StatefulWidget {
  const ChatGptApp({super.key});

  @override
  State<ChatGptApp> createState() => _ChatGptAppState();
}

class _ChatGptAppState extends State<ChatGptApp> {
  late AuthenticationRepository authenticationRepository = watch();
  late ConfigurationRepository configurationRepository = watch();

  bool get dark => configurationRepository().dark;
  bool get authenticated => authenticationRepository.authenticated;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return FTheme(
          data: switch (dark) {
            false => FThemes.yellow.light,
            true => FThemes.yellow.dark,
          },
          child: child!,
        );
      },
      home: authenticated ? HomePage() : LoginPage(),
    );
  }
}
