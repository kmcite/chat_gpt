import 'package:chat_gpt/domain/apis/navigator.dart';
import 'package:chat_gpt/utils/extensions.dart';
import 'package:flutter/material.dart';

// class DetailsBloc extends Bloc {
//   void goBack() {
//     navigator.back();
//   }
// }

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'DETAILS'.text(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: navigator.back,
        ),
      ),
      body: Center(
        child: Placeholder(
          child: 'To be implemented'.text(),
        ),
      ),
    );
  }
}
