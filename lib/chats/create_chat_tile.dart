import 'package:chat_gpt/chats/models.dart';
import 'package:chat_gpt/main.dart';

class CreateChatTile extends UI {
  const CreateChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.edit_square),
      onTap: () {
        final newChat = Chat();
        chatsRM.put(newChat);
      },
      title: 'New Chat'.text(),
    );
  }
}
