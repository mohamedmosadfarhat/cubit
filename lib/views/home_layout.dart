import 'package:flutter/material.dart';
import 'package:cubit/views/screens/main_screen.dart';
import 'package:cubit/views/screens/person_screen.dart';
import 'package:cubit/views/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends  StatefulWidget {
  HomeScreen( {super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getEmail();
  }

  String userEmail="";
  int currentIndex = 0;

  List<Widget> screens =
  [
    const MainScreen(),
    const PersonScreen(),
    const SettingsScreen(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'HomeScreen',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showSelectedLabels: false,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: false,
        onTap: (index)
        {
          setState(() {
            currentIndex = index;
          });
        },
        items:
        const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
        ],
      ),
    );
  }

  getEmail()async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString("email")??"__";
    setState(() {

    });
  }
}
