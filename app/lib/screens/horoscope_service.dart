import 'dart:convert';
import 'package:http/http.dart' as http;

class HoroscopeService {
  final String baseUrl = 'https://aztro.sameerkumar.website/';

  Future<Map<String, dynamic>> fetchHoroscope(String sign) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'sign': sign,
        'day': 'today',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load horoscope data: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
