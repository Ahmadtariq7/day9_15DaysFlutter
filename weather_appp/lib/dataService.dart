import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    // creating Query Parametrs...
    final queryParameters = {
      'q': city,
      'appid': 'a8f730a4b4c115302b9d19d4c35566e3',
      'units': 'metric'
    };
    // creating URI, 1st argument is BASE URL, 2nd is PATh, 3rd is queryPArameters
    final uri = Uri.http(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    print(response.body);

    // AS WE ARE IN FUTURE
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
