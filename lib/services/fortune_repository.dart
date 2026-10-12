import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/fortune.dart';

class FortuneRepository {
  static Future<Fortune> loadToday() async {
    final raw = await rootBundle.loadString('assets/data/daily_fortunes.json');
    final list = (jsonDecode(raw) as List)
        .map((e) => Fortune.fromJson(e as Map<String, dynamic>))
        .toList();

    final now = DateTime.now();
    final key =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    // 오늘 날짜 데이터가 있으면 그걸, 없으면 날짜 수에 맞춰 돌려쓰기 (빈 화면 방지)
    return list.firstWhere(
      (f) => f.date == key,
      orElse: () => list[now.difference(DateTime(now.year)).inDays % list.length],
    );
  }
}
