import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://www.ccair.org/wp-content/plugins/phastpress/phast.php/c2Vydm/ljZT1pbWFnZXMmc3JjPWh0dHBzJTNBJTJGJTJGd3d3LmNjYWlyLm9yZyUyRndwLWNvbnRlbnQlMkZ1cGxvYWRzJTJGMjAxNSUyRjA0JTJGd2FsbHBhcGVyLWZvci1mYWNlYm9vay1wcm9maWxlLXBob3RvLWUxNDQwNjI0NTA1NTc0LmpwZyZjYWNoZU1hcmtlcj0xNTE3MTc3MDkwLTE2OTc4JnRva2VuPTY4NDIyY2YwN2Q4ODAxZmM.q.jpg')
            ),
          ),
          const SizedBox(height: 16.0),
          const Center(
            child: Text(
              'Henry Turrones',
              style: TextStyle(
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
          buildTextField('Email', 'erick@gmail.com'),
          buildTextField('Phone', '+51 994 398 312'),
          buildTextField('Address', 'Lima, Lince'),
          buildTextField('Facebook', '@Maconsa'),
          buildTextField('Instagram', '@Maconsa'),
          buildTextField('Twitter', '@Maconsa'),
        ],
      ),
    );
  }
}

@override
Widget buildTextField(
    String labelText, String placeHolder) {
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
                            hintStyle:
                                const TextStyle(color: Colors.black, fontSize: 16)),
                      ))))
        ],
      ));
}
