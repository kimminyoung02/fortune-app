class ZodiacFortune {
  final String sign;
  final int rank;
  final String text;
  final String luckyColor;
  final String luckyItem;

  const ZodiacFortune({
    required this.sign,
    required this.rank,
    required this.text,
    required this.luckyColor,
    required this.luckyItem,
  });

  factory ZodiacFortune.fromJson(Map<String, dynamic> json) => ZodiacFortune(
        sign: json['sign'] as String,
        rank: json['rank'] as int,
        text: json['text'] as String,
        luckyColor: json['luckyColor'] as String,
        luckyItem: json['luckyItem'] as String,
      );
}

/// 생일(월/일)로 별자리 이름 구하기. 마이 화면에서 등록한 생일로 쓸 예정.
String zodiacFromBirthday(int month, int day) {
  final v = month * 100 + day;
  if (v >= 120 && v <= 218) return '물병자리';
  if (v >= 219 && v <= 320) return '물고기자리';
  if (v >= 321 && v <= 419) return '양자리';
  if (v >= 420 && v <= 520) return '황소자리';
  if (v >= 521 && v <= 621) return '쌍둥이자리';
  if (v >= 622 && v <= 722) return '게자리';
  if (v >= 723 && v <= 822) return '사자자리';
  if (v >= 823 && v <= 923) return '처녀자리';
  if (v >= 924 && v <= 1022) return '천칭자리';
  if (v >= 1023 && v <= 1122) return '전갈자리';
  if (v >= 1123 && v <= 1221) return '사수자리';
  return '염소자리'; // 12/22 ~ 1/19
}
