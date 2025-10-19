import 'package:chat_gpt/utils/repository.dart';

class HomeRepository extends Repository {
  // String _message = '';
  // String message([String? value]) {
  //   if (value != null) {
  //     _message = value;
  //   }
  //   return _message;
  // }
  final actions = [
    "Generate text content",
    "Answer factual questions",
    "Translate text between languages",
    "Summarize lengthy documents",
    "Provide coding assistance",
    "Create schedules or plans",
    "Offer suggestions for creative projects",
    "Explain complex concepts simply",
    "Analyze data for patterns and trends",
    "Generate images or art",
    "Assist with debugging code",
    "Create interactive tutorials",
  ];
}
