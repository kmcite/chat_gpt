import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

import 'models.dart';

class HistoryListUI extends UI {
  const HistoryListUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FTileGroup.builder(
        count: chatsRM.count(),
        tileBuilder: (context, index) {
          final chat = chatsRM.getAll().elementAt(index);
          return chatRM.inherited(
            stateOverride: () => chat,
            builder: (context) {
              return FTile(
                onPress: () {
                  idRM.state = chat.id;
                  navigator.back();
                },
                enabled: chatRM.of(context).id == chat.id,
                title: chat.title.text(),
                suffixIcon: IconButton(
                  onPressed: () {
                    chatsRM.remove(chat.id);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

final chatRM = RM.inject<Chat>(() => throw UnimplementedError());
