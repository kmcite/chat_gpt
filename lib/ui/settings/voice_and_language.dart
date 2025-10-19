import 'package:chat_gpt/domain/apis/configuration_repository.dart';
import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

class VoiceAndLanguageView extends StatefulWidget {
  const VoiceAndLanguageView({super.key});

  @override
  State<VoiceAndLanguageView> createState() => _VoiceAndLanguageViewState();
}

class _VoiceAndLanguageViewState extends State<VoiceAndLanguageView> {
  late ConfigurationRepository configuration = watch();
  void onVoiceOverChanged(VoiceOvers voiceOver) {
    configuration.voiceOver(voiceOver);
  }

  void onLanguageChanged(Languages language) {
    configuration.language(language);
  }

  @override
  Widget build(BuildContext context) {
    return FCard(
      child: Column(
        children: [
          FItem(
            title: 'Voice Overs'.text().pad(),
          ),
          FItemGroup(
            children: VoiceOvers.values.map(
              (voice) {
                return FItem(
                  selected: voice == configuration().voiceOver,
                  title: voice.name.text(),
                  onPress: () => onVoiceOverChanged(voice),
                  suffix: Icon(
                    voice == configuration().voiceOver
                        ? FIcons.checkCheck
                        : FIcons.info,
                  ),
                );
              },
            ).toList(),
          ),
          FItem(
            title: 'LANGUAGE'.text().pad(),
          ),
          FItemGroup(
            children: Languages.values.map(
              (language) {
                return FItem(
                  selected: language == configuration().language,
                  title: language.name.text(),
                  onPress: () => onLanguageChanged(language),
                  suffix: Icon(
                    language == configuration().language
                        ? FIcons.checkCheck
                        : FIcons.info,
                  ),
                );
              },
            ).toList(),
          ),

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
        ],
      ),
    );
  }
}
