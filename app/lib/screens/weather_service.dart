import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/screens/map.dart'; 

class WeatherService {
  final String apiKey = '3b616082f31e01eb41dba63bd9f1957b';

  Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
