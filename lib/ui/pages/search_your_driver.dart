import 'package:flutter/material.dart';

class SearchYourDriver extends StatefulWidget {
  const SearchYourDriver({super.key});

  @override
  State<SearchYourDriver> createState() => _SearchYourDriverState();
}

class _SearchYourDriverState extends State<SearchYourDriver> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      Center(
        child: Text('Search your driver screen'),
      ),
    );
  }
}