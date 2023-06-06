import 'package:flutter/material.dart';
import 'package:test_app/Screen_Main.dart';
import 'Screen_1.dart';
import 'Screen_2.dart';

import 'Screen_3.dart';
import 'Screen_4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class MenuItem {
  Widget icon;
  String name;

  MenuItem(this.icon, this.name);
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = -1;
  String _headerText = "";

  final List<MenuItem> _menuItems = [
    MenuItem(
        const Icon(
          Icons.map,
          size: 30,
          color: Colors.black,
        ),
        "Карты"),
    MenuItem(
        const Icon(Icons.person, size: 30, color: Colors.black), "Персонажи"),
    MenuItem(
        Container(
          height: 30,
          color: Colors.white,
          child: Image.asset("lib/assets/gun.png", color: Colors.black),
        ),
        "Оружие"),
    MenuItem(
        const Icon(
          Icons.settings,
          color: Colors.black,
          size: 30,
        ),
        "Настройки"),
  ];

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    Screen_1(),
    Screen_2(),
    Screen_3(),
    Screen_4(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _headerText = _menuItems[index].name;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (_selectedIndex != -1) {
      child = _widgetOptions.elementAt(_selectedIndex);
    } else {
      child = Screen_Main();
    }
    return Scaffold(
      appBar: AppBar(
          title: Container(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = -1;
                        _headerText = "";
                      });
                    },
                    icon: Image.asset(
                      "lib/assets/logo.jpg",
                      width: 90,
                    )),
                Text(_headerText)
              ],
            ),
          ),
          backgroundColor: Colors.grey),
      body: Center(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          ..._menuItems
              .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.name))
        ],
        currentIndex: _selectedIndex == -1 ? 0 : _selectedIndex,
        selectedItemColor:
            _selectedIndex != -1 ? Colors.amber[800] : Colors.white,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
