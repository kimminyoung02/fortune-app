class FortuneItem {
  final double score;
  final String text;
  const FortuneItem({required this.score, required this.text});

  factory FortuneItem.fromJson(Map<String, dynamic> json) => FortuneItem(
        score: (json['score'] as num).toDouble(),
        text: json['text'] as String,
      );
}

class Fortune {
  final String date;
  final String message;
  final FortuneItem overall, study, love, money;
  final String luckyColor;
  final int luckyNumber;
  final String luckyItem;

  const Fortune({
    required this.date,
    required this.message,
    required this.overall,
    required this.study,
    required this.love,
    required this.money,
    required this.luckyColor,
    required this.luckyNumber,
    required this.luckyItem,
  });

  factory Fortune.fromJson(Map<String, dynamic> json) => Fortune(
        date: json['date'] as String,
        message: json['message'] as String,
        overall: FortuneItem.fromJson(json['overall']),
        study: FortuneItem.fromJson(json['study']),
        love: FortuneItem.fromJson(json['love']),
        money: FortuneItem.fromJson(json['money']),
        luckyColor: json['lucky']['color'] as String,
        luckyNumber: json['lucky']['number'] as int,
        luckyItem: json['lucky']['item'] as String,
      );
}
