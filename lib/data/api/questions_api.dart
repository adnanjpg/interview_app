import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:interview/data/api/api.dart';
import 'package:interview/models/question.dart';
import 'package:http/http.dart';

class QuestionsApi {
  static const int _pageSize = 10;

  /// returns null if case of exception
  static Future<List<Question>?> list({required int currentPage}) async {
    // https://api.stackexchange.com/2.3/questions?page=2&pagesize=3&order=desc&sort=activity&site=stackoverflow
    final Map<String, Object> params = {
      'page': currentPage,
      'pageSize': _pageSize,
      'site': siteName,
      'order': 'desc',
      'sort': 'activity',
    };

    final paramstr =
        params.entries.map((e) => e.key + '=' + e.value.toString()).join('&');

    final request = getFullDomain() + '/' + 'questions?' + paramstr;

    final response = await get(
      Uri.parse(request),
    );

    if (response.statusCode != 200) {
      debugPrint(response.statusCode.toString());
      return null;
    }

    final decoded = json.decode(response.body);

    final items = decoded['items'];

    // handles null check and type check
    if (items is! List) {
      return null;
    }

    final questions = items.map((e) => Question.fromJson(e)).toList();

    return questions;
  }
}
