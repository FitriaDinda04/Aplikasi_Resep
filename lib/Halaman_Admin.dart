import 'package:flutter/material.dart';
import 'home_admin.dart';
import 'home_admin_2.dart';
import 'tambahResepAdmin.dart';
import 'profil.dart';

class navAdmin extends StatefulWidget {
  const navAdmin({Key? key}) : super(key: key);

  @override
  State<navAdmin> createState() => _navAdminState();
}

class _navAdminState extends State<navAdmin> {
  int _counter = 0;
  int _botton = 0;

  final List<Widget> _item = [
    tampilTrueAdmin(),
    homeAdmin(),
    tambahResepAdmin(),
    profil(),
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
              Icons.playlist_add_check_circle,
              color: Colors.orange,
            ),
            label: 'Dikonfirmasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.playlist_add_circle,
              color: Colors.orange,
            ),
            label: 'Belum Dikonfirmasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: Colors.orange,
            ),
            label: 'Tambah Resep',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.orange,
            ),
            label: 'Profil',
          ),
        ],
        currentIndex: _botton,
        onTap: _onItemTap,
      ),
    );
  }
}
