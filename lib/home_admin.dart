import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'tambahResepAdmin.dart';
import 'Halaman_Admin.dart';

final db = FirebaseFirestore.instance;
String? v_judul;
String? v_penulis;
String? v_bahan;
String? v_cara;

class homeAdmin extends StatefulWidget {
  const homeAdmin({Key? key}) : super(key: key);
  _homeAdminState createState() => _homeAdminState();
}

class _homeAdminState extends State<homeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Resep belum dikonfirmasi'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        toolbarHeight: 75,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(85),
            bottomLeft: Radius.circular(85),
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
          // Reading Items form our Database Using the StreamBuilder widget
          stream: db.collection('RESEP').where('status', isEqualTo: 'false').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(15.0),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, int index) {
                DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                return ListTile(
                  leading: Image.asset("images/logoo.png", height: 50, width: 50),
                  title: Text(documentSnapshot['judul']),
                  subtitle: Text(documentSnapshot['penulis']),
                  selected: true,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return bodyWidget(context, true, documentSnapshot);
                      },
                    );
                  },
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                    onPressed: () {
                      // Here We Will Add The Delete Feature

                      showDialog(
                        context: context,
                        builder: (_) => SimpleDialog(
                          title: Text(
                            'Yakin ingin menghapus resep ini?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          children: [
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  db.collection('RESEP').doc(documentSnapshot.id).delete();
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => navAdmin()));
                                  showDialog(
                                    context: context,
                                    builder: (_) => SimpleDialog(
                                      title: Text(
                                        'Berhasil!!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      children: [
                                        Center(
                                          child: Text(
                                            'Resep berhasil dihapus',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Hapus',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context, bool bool, DocumentSnapshot<Object?> documentSnapshot) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        child: Column(children: [
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => navAdmin()));
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 300,
            height: 210,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/logo.png")),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 320,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    (documentSnapshot!['judul']),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (documentSnapshot!['penulis']),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 320,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    'Bahan: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (documentSnapshot!['bahan']),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Cara Pembuatan: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (documentSnapshot!['cara']),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                db.collection('RESEP').doc(documentSnapshot?.id).update({
                  'status': 'true',
                });
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => navAdmin()));
              },
              child: Text(
                'Konfirmasi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
