import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import '../models/profiles.dart';


class ProfileService{
  final String urlBase = 'https://zendriver.azurewebsites.net/api/v1/driver';

  Future<List<Profiles>> getUserById(int userId) async{
    http.Response response = await http.get(Uri.parse('$urlBase/$userId'));
    if(response.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(response.body);
      final List drivers = jsonResponse(0);
      List<Profiles> users = drivers.map((map) => Profiles.fromJson(map)).toList();
      return users;
    }else{
      throw Exception('Failed to load profiles');
    }
    
  }

}