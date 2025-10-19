import 'package:chat_gpt/domain/apis/chats_repository.dart';
import 'package:chat_gpt/domain/models/chat.dart';
import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

class MessageInputBar extends StatefulWidget {
  const MessageInputBar({super.key});

  @override
  State<MessageInputBar> createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  late ChatsRepository chatsRepository = watch();
  late CurrentChatRepository currentChatRepository = watch();
  late MessagesRepository messagesRepository = watch();

  late final messageController = TextEditingController()..addListener(notify);

  Chat? get chat => currentChatRepository();
  void onChatCancelled() {
    currentChatRepository.update(null);
  }

  /// ACTIONS

  void onMessageSent() {
    // construct message
    final message = Message()..message = messageController.text;
    // if no chat is selected
    if (chat == null) {
      // create new chat
      final chat = Chat();
      // add message to chat
      message.chatId = chat.id;
      // save chat
      chatsRepository.put(chat);
      // save message
      messagesRepository.put(message);
      // update current chat
      currentChatRepository.update(chat);
    } else {
      // save message to the currently selected chat
      messagesRepository.put(message..chatId = chat!.id);
    }
    messageController.clear();
    notify();
  }

  void onVoiceActivated() {
    print('voice');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FTextField(hint: 'Type a message', controller: messageController).pad(),
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FButton.icon(onPress: () {}, child: Icon(FIcons.plus)),
            FButton.icon(
              onPress: messageController.text.isNotEmpty
                  ? onMessageSent
                  : onVoiceActivated,
              child: Icon(
                messageController.text.isEmpty ? FIcons.mic : FIcons.arrowUp,
              ),
            ),
          ],
        ).pad(),
      ],
    );
  }
}
