import 'package:chat_gpt/domain/apis/authentication.dart';
import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  late AuthenticationRepository authenticationRepository = watch();

  String get userName => authenticationRepository().userName;

  @override
  Widget build(BuildContext context) {
    return FCard(
      image: Icon(Icons.verified_user, size: 50).pad(),
      child: Text(
        'Nice to see you again $userName, whats on your mind today',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
