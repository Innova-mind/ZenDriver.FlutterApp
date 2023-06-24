import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zendriver/models/profiles.dart';
import 'package:zendriver/services/profile_service.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  userProfile? user;
  ProfileService? profileService;
  Future<SharedPreferences>? _prefs;
  String? tuken;
  String? id;
  int? userId;

  initialize() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      userId = prefs.getInt('userId');
      user = await profileService?.getData(userId!);
      setState(() {
        user = user;
      });
  }
  @override
  void initState() {
    _prefs = SharedPreferences.getInstance();
    profileService = ProfileService();
    initialize();
    _getToken();
    super.initState();
  }

  void _getToken() async {
    final pref = await _prefs;
    tuken = pref?.getString('token');
    id = pref?.getString('id');
  }
  
  @override
  void dispose() {
    super.dispose();
  }

  void signOut() async {
    final pref = await _prefs;
    pref?.clear();
    navigateToLogin();
  }

  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SigninScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? image = user?.imageUrl;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 55.0),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    user == null
                    ? 'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg'
                    : user!.imageUrl,),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Text(
                  '${user?.firstName} ${user?.lastName}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Center(
                child: Text(
                  '${user?.description}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 16.0),
              buildTextField('Username', '${user?.userName}'),
              buildTextField('Password', '${user?.password}'),
              buildTextField('Email', 'test@gmail.com'),
              buildTextField('Phone', '${user?.phone}'),
              buildTextField('Address', 'Lima'),
              buildTextField('Role', '${user?.role}'),
              buildTextField('BrithdayDate', '${user?.birthdayDate}'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: signOut,
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@override
Widget buildTextField(String labelText, String placeHolder) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 200,
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: placeHolder,
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 16)),
                      ))))
        ],
      ));
}

