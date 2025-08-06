import 'dart:convert';

import 'package:a_store/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class MyHttpClient {
  static const String _baseUrl = MyApiConstants.baseUrl;

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final responce = await http.get(Uri.parse(_baseUrl + endpoint));
    return _handleResponse(responce);
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final responce = await http.post(Uri.parse(_baseUrl + endpoint),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    return _handleResponse(responce);
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final responce = await http.put(Uri.parse(_baseUrl + endpoint),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    return _handleResponse(responce);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final responce = await http.delete(Uri.parse(_baseUrl + endpoint));
    return _handleResponse(responce);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    final dynamic data = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: ${response.statusCode}');
    } else if (response.statusCode == 403) {
      throw Exception('Forbidden: ${response.statusCode}');
    } else if (response.statusCode == 404) {
      throw Exception('Not found: ${response.statusCode}');
    } else if (response.statusCode == 500) {
      throw Exception('Internal server error: ${response.statusCode}');
    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${data?['error']}');
    }
  }
}
