import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_appp/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': 'a8f730a4b4c115302b9d19d4c35566e3',
      'units': 'metric'
    };

    final uri = Uri.http(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
