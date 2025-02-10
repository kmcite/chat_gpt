import 'package:chat_gpt/chats/models.dart';

import '../main.dart';

final chatsRM = ChatsBloc(
  'chats',
  fromJson: Chat.fromJson,
);

class ChatsBloc extends RMC<Chat> {
  ChatsBloc(super.tag, {required super.fromJson});
}
