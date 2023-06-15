import 'package:flutter/material.dart';
import 'package:zendriver/models/profiles.dart';
import 'package:zendriver/services/profile_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Profiles? profiles;
  ProfileService? profileService;
  bool isLoading = true;

  Future initialize() async {
    try {
      profiles = await profileService?.getUser(3);
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    profileService = ProfileService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://www.ccair.org/wp-content/plugins/phastpress/phast.php/c2Vydm/ljZT1pbWFnZXMmc3JjPWh0dHBzJTNBJTJGJTJGd3d3LmNjYWlyLm9yZyUyRndwLWNvbnRlbnQlMkZ1cGxvYWRzJTJGMjAxNSUyRjA0JTJGd2FsbHBhcGVyLWZvci1mYWNlYm9vay1wcm9maWxlLXBob3RvLWUxNDQwNjI0NTA1NTc0LmpwZyZjYWNoZU1hcmtlcj0xNTE3MTc3MDkwLTE2OTc4JnRva2VuPTY4NDIyY2YwN2Q4ODAxZmM.q.jpg'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Text(
                  '${profiles?.user.firstName} ${profiles?.user.lastName}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Center(
                child: Text(
                  'Experience as a RRHH in driving with a semi-trailer, trailer and coupled with the guarantee of safety and the driving experience that this entails.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 16.0),
              buildTextField('Email', 'test@gmail.com'),
              buildTextField('Phone', '${profiles?.user.phone}'),
              buildTextField('Address', 'Lima, Lince'),
              buildTextField('Role', '${profiles?.user.role}'),
              buildTextField('BrithdayDate', '${profiles?.user.birthdayDate}'),
              buildTextField('StartingYear', '${profiles?.startingYear}'),
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
