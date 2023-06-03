import 'package:flutter/material.dart';
import 'package:zendriver/ui/shared/bottom_nav.dart';
import 'package:zendriver/ui/shared/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;
  BottomNav ?bottomNav;
  @override
  void initState() {
    bottomNav = BottomNav(currentIndex: (i){
      setState(() {
        index = i;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        body: Routes(index: index,),
        bottomNavigationBar: bottomNav,
      ),
    );
  }
}
