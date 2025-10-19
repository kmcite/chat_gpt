import 'package:chat_gpt/domain/apis/chats_repository.dart';
import 'package:chat_gpt/domain/apis/navigator.dart';
import 'package:chat_gpt/domain/models/chat.dart';
import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  late ChatsRepository chatsRepository = find();
  late CurrentChatRepository currentChatRepository = find();

  void selectChat(Chat chat) {
    currentChatRepository.update(chat);
    navigator.back();
  }

  void deleteChat(Chat chat) {
    chatsRepository.remove(chat);
  }

  Iterable<Chat> get chats => chatsRepository();

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: 'Past History'.text(),
        prefixes: [
          FButton.icon(onPress: () => navigator.back(), child: Icon(FIcons.x)),
        ],
      ),
      child: FTileGroup.builder(
        label: 'Conversations'.text(),
        count: chats.length,
        tileBuilder: (context, index) {
          final chat = chats.elementAt(index);
          return FTile(
            onPress: () => selectChat(chat),
            title: chat.title.text(),
          );
        },
      ),
    );
  }
}
