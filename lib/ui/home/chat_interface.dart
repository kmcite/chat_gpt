import 'package:chat_gpt/domain/apis/chats_repository.dart';
import 'package:chat_gpt/domain/apis/navigator.dart';
import 'package:chat_gpt/domain/models/chat.dart';
import 'package:chat_gpt/main.dart';
import 'package:chat_gpt/ui/history.dart';
import 'package:chat_gpt/ui/home/message_input_bar.dart';
import 'package:forui/forui.dart';

class ChatInterface extends StatefulWidget {
  const ChatInterface({super.key});

  @override
  State<ChatInterface> createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  late ChatsRepository chatsRepository = watch();
  late CurrentChatRepository currentChatRepository = watch();
  late MessagesRepository messagesRepository = watch();
  Chat? get chat => currentChatRepository();
  void onChatCancelled() {
    currentChatRepository.update(null);
  }

  Iterable<Message> getMessages(int chatId) {
    return messagesRepository().where(
      (message) => message.chatId == chatId,
    );
  }

  Iterable<Message> get messages => getMessages(chat!.id);

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: chat!.title.text(),
        prefixes: [
          FButton.icon(
            onPress: () {
              navigator.to(HistoryView());
            },
            child: Icon(FIcons.menu),
          ),
        ],
        suffixes: [
          FButton.icon(
            onPress: onChatCancelled,
            child: Icon(FIcons.x),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages.elementAt(index);
                return FTile(
                  title: message.message.text(),
                  subtitle: message.chatId != null
                      ? 'User'.text()
                      : 'AI'.text(),
                  suffix: FButton.icon(
                    onPress: () {
                      messagesRepository.remove(message);
                    },
                    child: Icon(FIcons.x),
                  ),
                );
              },
            ),
          ),
          MessageInputBar(),
        ],
      ),
    );
  }
}
