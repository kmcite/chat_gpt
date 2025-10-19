import 'package:chat_gpt/domain/apis/chats_repository.dart';
import 'package:chat_gpt/domain/apis/configuration_repository.dart';
import 'package:chat_gpt/domain/apis/navigator.dart';
import 'package:chat_gpt/domain/models/chat.dart';
import 'package:chat_gpt/main.dart';
import 'package:chat_gpt/ui/history.dart';
import 'package:chat_gpt/ui/home/chat_interface.dart';
import 'package:chat_gpt/ui/home/message_input_bar.dart';
import 'package:chat_gpt/ui/home/suggestions_bar.dart';
import 'package:chat_gpt/ui/home/user_card.dart';
import 'package:chat_gpt/ui/settings/settings.dart';
import 'package:forui/forui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfigurationRepository configurationRepository = watch();
  late ChatsRepository chatsRepository = watch();

  /// STATE
  Iterable<Chat> get chats => chatsRepository();
  String get userName => configurationRepository().userName;

  late CurrentChatRepository currentChatRepository = watch();
  Chat? get chat => currentChatRepository();
  void onChatCancelled() {
    currentChatRepository.update(null);
  }

  /// VIEW
  @override
  Widget build(BuildContext context) {
    if (chat == null) {
      return FScaffold(
        header: FHeader.nested(
          prefixes: [
            FButton.icon(
              child: Icon(FIcons.menu),
              onPress: () {
                navigator.to(HistoryView());
              },
            ),
          ],
          title: 'Copilot'.text(),
          suffixes: [
            FButton.icon(
              child: Icon(FIcons.settings2),
              onPress: () => navigator.to(SettingsView()),
            ),
          ],
        ),
        child: Column(
          children: [UserCard(), Spacer(), SuggestionsBar(), MessageInputBar()],
        ),
      );
    } else {
      return ChatInterface();
    }
  }
}
