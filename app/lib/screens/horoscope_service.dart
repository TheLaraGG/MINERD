import 'dart:convert';
import 'package:http/http.dart' as http;

class HoroscopeService {
  Future<Map<String, dynamic>> fetchHoroscope(String sign) async {
    final response = await http.post(
      Uri.parse('https://aztro.sameerkumar.website/?sign=$sign&day=today'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load horoscope data');
    }
  }
}
