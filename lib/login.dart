import 'profil.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false, // set it to false
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset('images/logoo.png', width: 280.0),
              Text('Login Admin', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.person_outline, size: 20),
                          hintText: "Masukan Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: hidePass,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock_open_outlined, size: 20),
                    hintText: "Masukan Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fitur masih dalam pengembangan')));
                        },
                        child: Text('Forgot Password?'))
                  ])),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (userNameController.text == 'kel11' && passwordController.text == "kel11") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Berhasil Login'),
                      ));

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => profil()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Username atau password salah'),
                      ));
                    }
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ));
  }
}
