import 'package:flutter/material.dart';
import 'package:zendriver/ui/pages/home.dart';
import 'package:zendriver/ui/pages/messages.dart';
import 'package:zendriver/ui/pages/notifications.dart';
import 'package:zendriver/ui/pages/profile.dart';
import 'package:zendriver/ui/pages/search_your_driver.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});


  @override
  Widget build(BuildContext context) {
    List<Widget> routes = [
      const Home(),
      const SearchYourDriver(),
      const Messages(),
      const Notifications(),
      const Profile(),
    ];

    return routes[index];
  }
}