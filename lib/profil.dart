import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(),
    );
  }
}
