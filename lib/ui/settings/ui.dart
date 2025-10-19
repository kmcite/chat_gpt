import 'package:chat_gpt/domain/apis/configuration_repository.dart';
import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FTileGroup(
      children: [
        FTile(
          title: 'Account'.text().pad(),
        ),
        FTile(
          prefix: Icon(FIcons.gitMerge),
          title: 'EMAIL'.text().pad(),
        ),
        FTile(
          prefix: Icon(FIcons.medal),
          title: 'SUBSCRIPTIONS'.text().pad(),
        ),
        FTile(
          prefix: Icon(FIcons.expand),
          title: 'DATA CONTROLS'.text().pad(),
        ),
        FTile(
          prefix: Icon(FIcons.instagram),
          title: 'CUSTOM INSTRUCTIONS'.text().pad(),
        ),
      ],
    );
  }
}

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  late ConfigurationRepository configurationRepository = watch();

  bool get dark => configurationRepository().dark;

  void onDarkToggled() {
    configurationRepository.dark(!dark);
  }

  @override
  Widget build(BuildContext context) {
    return FTileGroup(
      children: [
        FTile(
          title: 'Colors Mode'.text().pad(),
        ),
        FTile(
          title: Icon(dark ? FIcons.sun : FIcons.moon),
          onPress: () => onDarkToggled(),
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
