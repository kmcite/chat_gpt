import 'package:chat_gpt/domain/apis/navigator.dart';
import 'package:chat_gpt/ui/history.dart';
import 'package:chat_gpt/utils/extensions.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  void goBack() {
    navigator.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(
            hintText: 'Search',
            leading: BackButton(
              onPressed: goBack,
            ),
          ).pad(),
          HistoryView(),
        ],
      ),
    );
  }
}
