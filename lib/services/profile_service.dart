import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/profiles.dart';

class ProfileService {
  final String baseUrl = 'https://zendriver.azurewebsites.net/api/v1/driver';

  Future<Profiles?> getUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/$userId'));
    if (response.statusCode == HttpStatus.ok) {
      final jsonData = json.decode(response.body);
      return Profiles.fromJson(jsonData);
    } else {
      throw Exception('Failed to load');
    }
  }
}
