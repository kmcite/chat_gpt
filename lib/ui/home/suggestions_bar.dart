import 'package:chat_gpt/domain/apis/actions_repository.dart';
import 'package:chat_gpt/main.dart';
import 'package:forui/forui.dart';

class SuggestionsBar extends StatefulWidget {
  const SuggestionsBar({super.key});

  @override
  State<SuggestionsBar> createState() => _SuggestionsBarState();
}

class _SuggestionsBarState extends State<SuggestionsBar> {
  late HomeRepository homeRepository = watch();

  List<String> get actions => homeRepository.actions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          actions.length,
          (index) => FBadge(
            child: actions[index].text(),
          ).pad(),
        ),
      ),
    );
  }
}
