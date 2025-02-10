import '../main.dart';

class Chat {
  String id = randomId;
  String title = '';

  String _cards = '';
  List<QueryResponseModel> get cards {
    try {
      return (jsonDecode(_cards) as List).map(
        (json) {
          try {
            return QueryResponseModel.fromJson(json);
          } catch (e) {
            return QueryResponseModel();
          }
        },
      ).toList();
    } catch (e, st) {
      print(st);
      return [];
    }
  }

  set cards(List<QueryResponseModel> value) {
    _cards = jsonEncode(
      value.map(
        (queryResp) {
          return queryResp.toJson();
        },
      ).toList(),
    );
  }

  // List<QueryResponseModel> cards = [];
  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    title = json['title'] ?? '';
    _cards = json['_cards'] ?? '';
  }
  Chat();
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      '_cards': _cards,
    };
  }
}

class QueryResponseModel {
  bool isResponseCard = false;
  String content = '';
  DateTime dateTime = DateTime.now();
  QueryResponseModel.fromJson(Map<String, dynamic> json) {
    isResponseCard = json['isResponseCard'];
    content = json['content'];
    dateTime = DateTime.fromMicrosecondsSinceEpoch(
      int.tryParse(json['dateTime'] ?? '') ?? 0,
    );
  }
  QueryResponseModel();

  Map<String, dynamic> toJson() {
    return {
      'isResponseCard': isResponseCard,
      'content': content,
      'dateTime': dateTime.microsecondsSinceEpoch,
    };
  }
}
