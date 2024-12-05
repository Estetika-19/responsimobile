import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsi/amiibo_model.dart';


class ApiService {
  final String baseUrl = "https://www.amiiboapi.com/";

  Future<List<Amiibo>> fetchAgents() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List;
      return data.map((agent) => Amiibo.fromJson(agent)).toList();
    } else {
      throw Exception('Failed to load Amiibos');
    }
  }
}
