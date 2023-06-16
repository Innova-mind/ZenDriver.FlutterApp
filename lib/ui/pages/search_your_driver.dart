import 'package:flutter/material.dart';
import 'package:zendriver/ui/pages/filtered_drivers.dart';

class SearchYourDriver extends StatefulWidget {
  const SearchYourDriver({super.key});

  @override
  State<SearchYourDriver> createState() => _SearchYourDriverState();
}

class _SearchYourDriverState extends State<SearchYourDriver> {
  final _licenseList = ["AI", "AIIA", "AIIB", "AIIIB", "AIIIA", "AIIIC"];

  
  String? selectedlicense = "AI";
  final TextEditingController _ageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 65,
          ),
          const Column(
            children: [
              Image(
                  image: AssetImage('assets/logo.png'), width: 50, height: 50),
              Text(
                'ZenDriver',
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  '¿Cual es su chofer ideal?',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 350,
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Años de experiencia',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            child: TextFormField(
              controller: _ageController
              ,
              decoration: const InputDecoration(
                  label: Text('Edad'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Edad'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Grado de estudios'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 150,
            child: DropdownButtonFormField(
                
                decoration: const InputDecoration(
                  
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Tipo de licencia'),
                icon: const Icon(Icons.arrow_drop_down),
                value: selectedlicense,
                items: _licenseList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedlicense = val as String;
                  });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                    backgroundColor: const Color.fromRGBO(0, 150, 136, 1),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                    
                    MaterialPageRoute(builder: (context) => FilteredDrivers(licenseType: selectedlicense!)));
                  },
                  child: const Text(
                    'Filtrar ya',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
