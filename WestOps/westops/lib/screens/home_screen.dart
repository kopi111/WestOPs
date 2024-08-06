import 'package:flutter/material.dart';
import 'package:westops/screens/duty.dart';
import 'package:westops/screens/missing_screen.dart';
import 'package:westops/screens/missing_screen.dart';
import 'package:westops/screens/wanted.dart';
import 'package:westops/screens/home2.dart';
import 'package:westops/screens/traffic_screen.dart';
import 'package:westops/screens/wordingbooklet_screen.dart';
import 'package:westops/screens/stolenMotorVehicle_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    DutyScreen(),
    StolenMotorVehicleScreen(),
    Wanted(),
    MissingPersonsScreen(),
    WordingBookPage(),
    TrafficBookPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Kingston Western Operation'),
        backgroundColor: Colors.blue,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Duty',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Stolen Vehicles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Wanted Persons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Missing Persons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Wording Booklet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair_sharp),
            label: 'Traffic Offences & Stolen Vehicles',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 18, 22, 236),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
