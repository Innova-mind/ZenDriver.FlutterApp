import 'package:zendriver/models/user.dart';

class Driver{
  int? id;
  User? user;

  Driver({required this.id, required this.user});
  

  Driver.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      user = User.fromJson(json['user']);
  
}