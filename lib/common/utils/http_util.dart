import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboarding/global.dart';

class HttpUtil {
  static final String _token=Global.strorageService.getUserToken();

  static Future<Map<String, dynamic>> get(String url) async {
    final response = await http.get(Uri.parse(url), headers: _getHeaders());
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> post(String url, dynamic body) async {
    final response = await http.post(Uri.parse(url), headers: _getHeaders(), body: jsonEncode(body));
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> put(String url, dynamic body) async {
    final response = await http.put(Uri.parse(url), headers: _getHeaders(), body: jsonEncode(body));
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String url) async {
    final response = await http.delete(Uri.parse(url), headers: _getHeaders());
    return _processResponse(response);
  }

  static Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
    };
  }

  static Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
