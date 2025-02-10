import 'package:chat_gpt/chats_page.dart';
import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

class HomePage extends UI {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final chat = chatRM.state;
    if (chat == null) {
      return ChatsPage();
    } else {
      return FScaffold(
        header: FHeader(
          actions: [
            FHeaderAction.x(onPress: () => idRM.state = ''),
          ],
          title: FTextField(
            initialValue: chat.title,
            onChange: (value) {
              chatsRM.put(chat..title = value);
            },
          ),
        ),
        content: const ChatPage(),
      );
    }
  }
}
