import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan1_11pplg1/models/hsr_character_model.dart';

class Characternetwork {
  static const String baseUrl = "https://hsr-api.vercel.app/api/v1/characters";

  static Future<List<CharacterList>> fetchCharacters() async {
    final response = await http
    .get(Uri.parse(baseUrl))
    .timeout(const Duration(seconds: 10), onTimeout: () {
  throw Exception("Request timeout after 10 seconds");
});


    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Validate that the response is a List before parsing
      if (data is List) {
        return characterListFromJson(response.body);
      } else {
        throw Exception("Unexpected data format");
      }
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
