import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profiles.dart';

class ProfileService {
  final String baseUrl = 'https://zendriver.azurewebsites.net/api/v1/users';

  
  Future<userProfile?> getData(int userId) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(Uri.parse('$baseUrl/$userId'), headers: {
      HttpHeaders.authorizationHeader: prefs.getString('token') ?? ''
    });
    if (response.statusCode == HttpStatus.ok) {
      return userProfile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }

}


