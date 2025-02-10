export 'package:manager/manager.dart';

import 'package:chat_gpt/authentication/login_page.dart';
import 'package:chat_gpt/chats/models.dart';
import 'package:chat_gpt/home_page.dart';
import 'package:forui/forui.dart';

import 'authentication/authentication_bloc.dart';
import 'main.dart';

export 'chat/chat_page.dart';
export 'dart:io';
export 'package:chat_gpt/chats/chats_bloc.dart';
export 'package:chat_gpt/chats/left_chats_page.dart';
export 'package:chat_gpt/details.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/material.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:path_provider/path_provider.dart';
export 'package:states_rebuilder/states_rebuilder.dart';
export 'package:uuid/uuid.dart';
export 'settings/settings_manager.dart';
export 'settings/themes.dart';
export 'navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RM.storageInitializer(HiveStorage());
  // await RM.deleteAllPersistState();
  runApp(ChatGptApp());
}

class ChatGptApp extends UI {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.key,
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return FTheme(
          data: switch (themeMode()) {
            ThemeMode.light => FThemes.yellow.light,
            _ => FThemes.yellow.dark,
          },
          child: child!,
        );
      },
      home: authenticationRM.isAuthenticated ? HomePage() : LoginPage(),
    );
  }
}

// global placeholder for current chat
final chatRM = RM.inject<Chat?>(
  () {
    return chatsRM.get(idRM.state);
  },
  dependsOn: DependsOn({idRM}),
);

// global placeholder for current chat id
final idRM = RM.inject<String>(() => '');

String get version => '0.1';
String get userName => 'Adnan Farooq';
