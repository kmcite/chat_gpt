import 'package:chat_gpt/utils/repository.dart';

class Configuration {
  var dark = (true);
  var version = ('0.1');
  var userName = ('Adnan Farooq');
  var voiceOver = VoiceOvers.breeze;
  var language = Languages.english;
}

enum VoiceOvers { juniper, cove, sky, ember, breeze, elen }

enum Languages { english, urdu, arabic, pashto }

class ConfigurationRepository extends Repository<Configuration> {
  @override
  init() {
    update(Configuration());
  }

  void dark(bool dark) {
    update(value..dark = dark);
  }

  void version(String version) {
    update(value..version = version);
  }

  void userName(String userName) {
    update(value..userName = userName);
  }

  void voiceOver(VoiceOvers voiceOver) {
    update(value..voiceOver = voiceOver);
  }

  void language(Languages language) {
    update(value..language = language);
  }
}
