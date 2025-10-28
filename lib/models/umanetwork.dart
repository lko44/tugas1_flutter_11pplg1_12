import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan1_11pplg1/models/uma_model.dart';

class Umanetwork {
  static const String baseUrl = "https://umapyoi.net/api/v1/character/list";

  static Future<List<UmaList>> fetchUmas() async {
    try {
      final response = await http
          .get(Uri.parse(baseUrl))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception("Request timeout after 10 seconds");
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is List) {
          return data.map((e) => UmaList.fromJson(e)).toList();
        } else {
          throw Exception("Unexpected data format");
        }
      } else {
        throw Exception("Failed to load Uma list (Status: ${response.statusCode})");
      }
    } catch (e) {
      throw Exception("Error fetching Uma list: $e");
    }
  }
}
