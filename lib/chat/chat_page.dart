import 'package:forui/forui.dart';

import '../chats/models.dart';
import '../main.dart';

class ChatPage extends UI {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = chatRM.state!;
    return FScaffold(
      content: Column(
        children: [
          Expanded(
            child: FTileGroup.builder(
              count: chat.cards.length,
              tileBuilder: (context, i) {
                final qrm = chat.cards[i];
                if (qrm.isResponseCard) {
                  return ResponseCard(qrModel: qrm);
                } else {
                  return QueryCard(qrModel: qrm);
                }
              },
            ),
          ),
          const QueryInputBar(),
        ],
      ),
    );
  }
}

class QueryInputBar extends UI {
  static final queryController = RM.injectTextEditing();
  const QueryInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FTextField(
            controller: queryController.controller,
            focusNode: queryController.focusNode,
            suffix: queryController.focusNode.hasFocus
                ? FButton.icon(
                    onPress: () {
                      final x = QueryResponseModel()
                        ..isResponseCard = false
                        ..content = queryController.text
                        ..dateTime = DateTime.now();

                      chatsRM.put(
                        chatRM.state!..cards = [...chatRM.state!.cards, x],
                      );
                      queryController.controller.clear();
                    },
                    child: Icon(Icons.arrow_upward),
                  )
                : VoiceChatIcon(),
            label: Text('Message'),
          ).pad(),
        ),
        const HeadphonesButton().pad(),
      ],
    );
  }
}

class VoiceChatIcon extends UI {
  const VoiceChatIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.voice_chat);
  }
}

class ResponseCard extends UI {
  const ResponseCard({super.key, required this.qrModel});
  final QueryResponseModel qrModel;

  @override
  Widget build(BuildContext context) {
    return FCard(
      // GPT RESPONSE CARD
      child: Column(
        children: [
          const SizedBox(height: 8),
          const ResponseCardTopRow(),
          const Divider(),
          FTile(
            title: qrModel.content.text(),
            subtitle: qrModel.dateTime.text(),
          ).pad(),
        ],
      ),
    );
  }
}

class ResponseCardTopRow extends UI {
  const ResponseCardTopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FIcon(FAssets.icons.arrowUpToLine).pad(),
        'ChatGPT'.text().pad(),
        FIcon(FAssets.icons.glasses).pad(),
      ],
    );
  }
}

class QueryCard extends UI {
  const QueryCard({super.key, required this.qrModel});
  final QueryResponseModel qrModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              FIcon(FAssets.icons.arrowUpToLine).pad(),
              'You'.text().pad(),
              FIcon(FAssets.icons.glasses).pad(),
            ],
          ),
          FTile(
            title: qrModel.content.text(),
            subtitle: qrModel.dateTime.text(),
          ).pad(),
        ],
      ),
    );
  }
}

class HeadphonesButton extends UI {
  const HeadphonesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FButton.icon(
      onPress: () {},
      child: FIcon(FAssets.icons.arrowUp),
    );
  }
}
