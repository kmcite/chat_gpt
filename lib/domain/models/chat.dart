import 'package:objectbox/objectbox.dart';

@Entity()
class Message {
  @Id()
  int id = 0;
  String message = '';
  int? chatId;
}

@Entity()
class Chat {
  @Id()
  int id = 0;
  String title = '';
}
