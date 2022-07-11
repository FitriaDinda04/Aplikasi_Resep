import 'package:app/home.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'tambahResep.dart';

class navUser extends StatefulWidget {
  const navUser({Key? key}) : super(key: key);

  @override
  State<navUser> createState() => _navUserState();
}

class _navUserState extends State<navUser> {
  int _counter = 0;
  int _botton = 0;

  final List<Widget> _item = [
    homeScreen(),
    tambahResep(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _botton = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _item.elementAt(_botton),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.orange,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: Colors.orange,
            ),
            label: 'Tambah Resep',
          ),
        ],
        currentIndex: _botton,
        onTap: _onItemTap,
      ),
    );
  }
}
