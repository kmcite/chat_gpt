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
