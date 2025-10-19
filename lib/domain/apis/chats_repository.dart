import 'dart:async';

import 'package:chat_gpt/domain/models/chat.dart';
import 'package:chat_gpt/utils/repository.dart';

class ChatsRepository extends CrudRepository<Chat> {
  @override
  int getId(Chat value) => value.id;
}

class CurrentChatRepository extends Repository<Chat?> {
  @override
  FutureOr<void> init() {
    update(null);
  }
}

class MessagesRepository extends CrudRepository<Message> {
  @override
  int getId(Message value) => value.id;
}
