import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/zodiac_fortune.dart';

class ZodiacRepository {
  /// 오늘의 12별자리를 1위부터 순서대로 돌려줌
  static Future<List<ZodiacFortune>> loadToday() async {
    final raw = await rootBundle.loadString('assets/data/zodiac_fortunes.json');
    final days = jsonDecode(raw) as List;

    final now = DateTime.now();
    final key =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    // 오늘 날짜가 없으면 날짜 수에 맞춰 돌려쓰기 (빈 화면 방지)
    final day = days.firstWhere(
      (d) => d['date'] == key,
      orElse: () => days[now.difference(DateTime(now.year)).inDays % days.length],
    );

    final list = (day['signs'] as List)
        .map((e) => ZodiacFortune.fromJson(e as Map<String, dynamic>))
        .toList();
    list.sort((a, b) => a.rank.compareTo(b.rank));
    return list;
  }
}
