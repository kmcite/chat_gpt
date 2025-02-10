import 'package:chat_gpt/main.dart';
import 'package:chat_gpt/settings/settings.dart';
import 'package:forui/forui.dart';

class ChatsPage extends UI {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'Chats'.text(),
        actions: [
          FHeaderAction(
            icon: FIcon(FAssets.icons.settings2),
            onPress: () => navigator.to(SettingsPage()),
          ),
        ],
      ),
      content: chatsRM.getAll().isEmpty
          ? Center(child: Text('No chats yet'))
          : FTileGroup.builder(
              count: chatsRM.count(),
              tileBuilder: (context, index) {
                final chat = chatsRM.getAll().elementAt(index);
                return FTile(
                  onPress: () => idRM.state = chat.id,
                  title: chat.title.text(),
                ).pad();
              },
            ),
    );
  }
}
