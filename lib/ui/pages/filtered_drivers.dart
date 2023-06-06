import 'package:flutter/material.dart';

class FilteredDrivers extends StatefulWidget {
  const FilteredDrivers({Key? key}) : super(key: key);

  @override
  State<FilteredDrivers> createState() => _FilteredDriversState();
}

class _FilteredDriversState extends State<FilteredDrivers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conductores filtrados'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: const Image(image: NetworkImage('https://crc891.com/wp-content/uploads/2020/05/598616.jpg'), width: 50, height: 50),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Henry Medina"),
                        SizedBox(height: 16),

                        Text("Profesión: Ingeniero Civil"),
                        SizedBox(height: 16),

                        Text("Años de experiencia: 5"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: const Image(image: NetworkImage("https://www.las2orillas.co/wp-content/uploads/2014/09/imagen-8a.jpg"), width: 50, height: 50),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Roberto Suin"),
                        SizedBox(height: 16),
                        Text("Profesión: Ingeniero Software"),
                        SizedBox(height: 16),

                        Text("Años de experiencia: 1"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
