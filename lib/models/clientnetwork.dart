import 'package:http/http.dart' as http;

class ClientNetwork {
  static final _client = http.Client();
  static const _baseUrl = "https://mediadwi.com/api/latihan";

  static Future<http.Response> postData(String endpoint, Map<String, String> body) async {
    final url = Uri.parse("$_baseUrl/$endpoint");
    return await _client.post(url, body: body);
  }

  static Future<http.Response> getData(String endpoint) async {
    final url = Uri.parse("$_baseUrl/$endpoint");
    return await _client.get(url);
  }
  
  static void close() {
    _client.close();
  }
}
