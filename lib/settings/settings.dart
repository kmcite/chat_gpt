import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

import '../authentication/authentication_bloc.dart';

class SettingsPage extends UI {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'Settings'.text().pad(),
        actions: [
          FHeaderAction.back(
            onPress: navigator.back,
          ),
          FHeaderAction(
            onPress: authenticationRM.logout,
            icon: FIcon(FAssets.icons.logOut),
          ),
        ],
      ),
      content: ListView(
        children: [
          const UserCard(),
          const AccountSection(),
          const AppSection(),
          const SpeechSection(),
          FTile(
            onPress: () {
              authenticationRM.logout();
            },
            prefixIcon: FIcon(FAssets.icons.logOut),
            title: 'Sign Out'.text(),
          )
        ],
      ),
    );
  }
}

class UserCard extends UI {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FCard(
      image: FIcon(
        FAssets.icons.user,
        size: 50,
      ).pad(),
      child: Row(
        children: [
          // '${authenticationRM.user.name}'.text(textScaleFactor: 2).pad(),
        ],
      ),
    );
  }
}

class AccountSection extends UI {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FTileGroup(
      children: [
        FTile(
          title: 'Account'.text(textScaleFactor: .8).pad(),
        ),
        FTile(
          prefixIcon: FIcon(FAssets.icons.gitMerge),
          title: 'EMAIL'.text().pad(),
        ),
        FTile(
          prefixIcon: FIcon(FAssets.icons.medal),
          title: 'SUBSCRIPTIONS'.text().pad(),
        ),
        FTile(
          prefixIcon: FIcon(FAssets.icons.expand),
          title: 'DATA CONTROLS'.text().pad(),
        ),
        FTile(
          prefixIcon: FIcon(FAssets.icons.instagram),
          title: 'CUSTOM INSTRUCTIONS'.text().pad(),
        ),
      ],
    );
  }
}

class AppSection extends UI {
  const AppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FTileGroup(
      children: [
        FTile(
          title: 'App'.text(textScaleFactor: .8).pad(),
        ),
        // DropdownButtonFormField(
        //   value: themeMode(),
        //   items: [ThemeMode.dark, ThemeMode.light].map(
        //     (themeMode) {
        //       return DropdownMenuItem(
        //         value: themeMode,
        //         child: themeMode.name.toUpperCase().text(),
        //       );
        //     },
        //   ).toList(),
        //   onChanged: themeMode,
        //   decoration: const InputDecoration(
        //     labelText: 'COLOR SCHEME',
        //     prefixIcon: Icon(Icons.color_lens),
        //   ),
        // ).pad(),
      ],
    );
  }
}

class SpeechSection extends UI {
  const SpeechSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FTile(
          title: 'Speech'.text(textScaleFactor: .8).pad(),
        ).pad(),
        // DropdownButtonFormField(
        //   value: VoiceOvers.juniper,
        //   items: VoiceOvers.values.map(
        //     (e) {
        //       return DropdownMenuItem(
        //         value: e,
        //         child: e.name.toUpperCase().text(),
        //       );
        //     },
        //   ).toList(),
        //   onChanged: (themeMode) {},
        //   decoration: const InputDecoration(
        //     labelText: 'VOICE',
        //     prefixIcon: Icon(Icons.voice_chat),
        //   ),
        // ).pad(),
        // DropdownButtonFormField(
        //   value: Languages.english,
        //   items: Languages.values.map(
        //     (e) {
        //       return DropdownMenuItem(
        //         value: e,
        //         child: e.name.toUpperCase().text(),
        //       );
        //     },
        //   ).toList(),
        //   onChanged: (themeMode) {},
        //   decoration: const InputDecoration(
        //     labelText: 'LANGUAGE',
        //     prefixIcon: Icon(Icons.language),
        //   ),
        // ).pad(),
        'For best results select the language you speak. If not listed it may be supprted via auto detection.'
            .text()
            .pad(),
      ],
    );
  }
}

enum VoiceOvers { juniper, cove, sky, ember, breeze, elen }

enum Languages { english, urdu, arabic, pashto }
