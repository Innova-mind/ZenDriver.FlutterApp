import 'package:flutter/material.dart';


class BottomNav extends StatefulWidget {
  final Function currentIndex;
  const BottomNav({super.key, required this.currentIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (int index) {
        setState(() {
          selectedIndex = index;
          widget.currentIndex(index);
        });
      },
      type : BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),

      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
      BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Mensajes'),
      BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificaciones'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      
    ]);
  }
}