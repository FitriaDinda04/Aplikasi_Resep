import 'package:flutter/material.dart';
import 'Halaman_Admin.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
String? v_judul;
String? v_penulis;
String? v_bahan;
String? v_cara;

class tambahResepAdmin extends StatefulWidget {
  @override
  State<tambahResepAdmin> createState() => _tambahResepAdminState();
}

class _tambahResepAdminState extends State<tambahResepAdmin> {
  final _formKey = GlobalKey<FormState>();

  final textarea1 = TextEditingController();
  final textarea2 = TextEditingController();
  final judul = TextEditingController();
  final penulis = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                "Tambahkan Resep!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  "Buat resep andalanmu",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        controller: judul,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.create,
                            color: Colors.orange,
                          ),
                          hintText: "Masukan Judul Resep",
                          labelText: "Judul",
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange), borderRadius: new BorderRadius.circular(5.0)),
                          focusedBorder: new OutlineInputBorder(borderSide: BorderSide(color: Colors.orange), borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Judul tidak boleh kosong';
                          }
                          return null;
                        },
                        onChanged: (String judul) {
                          // Storing the value of the text entered in the variable value.
                          v_judul = judul;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        controller: penulis,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.orange,
                          ),
                          hintText: "Masukan Nama Penulis",
                          labelText: "Penulis",
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange), borderRadius: new BorderRadius.circular(5.0)),
                          focusedBorder: new OutlineInputBorder(borderSide: BorderSide(color: Colors.orange), borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Penulis tidak boleh kosong';
                          }
                          return null;
                        },
                        onChanged: (String penulis) {
                          // Storing the value of the text entered in the variable value.
                          v_penulis = penulis;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        controller: textarea1,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.list,
                            color: Colors.orange,
                          ),
                          hintText: "Masukan Bahan Bahan",
                          labelText: "Bahan Bahan",
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange), borderRadius: new BorderRadius.circular(5.0)),
                          focusedBorder: new OutlineInputBorder(borderSide: BorderSide(color: Colors.orange), borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Bahan tidak boleh kosong';
                          }
                          return null;
                        },
                        onChanged: (String bahan) {
                          // Storing the value of the text entered in the variable value.
                          v_bahan = bahan;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        controller: textarea2,
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.list_alt,
                            color: Colors.orange,
                          ),
                          hintText: "Masukan Cara Pembuatan",
                          labelText: "Cara Pembuatan",
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange), borderRadius: new BorderRadius.circular(5.0)),
                          focusedBorder: new OutlineInputBorder(borderSide: BorderSide(color: Colors.orange), borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Cara tidak boleh kosong';
                          }
                          return null;
                        },
                        onChanged: (String cara) {
                          // Storing the value of the text entered in the variable value.
                          v_cara = cara;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 145,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                              ),
                              onPressed: () {
                                setState(() {
                                  judul.clear();
                                  penulis.clear();
                                  textarea1.clear();
                                  textarea2.clear();
                                });
                              },
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: 145,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orangeAccent,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => navAdmin()));

                                  db.collection('RESEP').add({
                                    'judul': v_judul,
                                    'penulis': v_penulis,
                                    'bahan': v_bahan,
                                    'cara': v_cara,
                                    'status': 'true',
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (_) => SimpleDialog(
                                      title: Text(
                                        'Resep Terkirim',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      children: [
                                        Center(
                                          child: Text(
                                            'Resep dengan judul ${judul.text} berhasil diupload',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Tambah Resep',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
