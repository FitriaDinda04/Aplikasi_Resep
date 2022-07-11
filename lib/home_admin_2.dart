import 'package:app/Halaman_Admin.dart';
import 'package:app/tambahResep.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'tambahResep.dart';
import 'Halaman_Admin.dart';

final db = FirebaseFirestore.instance;
String? v_judul;
String? v_penulis;
String? v_bahan;
String? v_cara;
String? v_status;

class tampilTrueAdmin extends StatefulWidget {
  const tampilTrueAdmin({Key? key}) : super(key: key);
  _tampilTrueAdminState createState() => _tampilTrueAdminState();
}

class _tampilTrueAdminState extends State<tampilTrueAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Resep Makanan'),
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
          stream: db.collection('RESEP').where('status', isEqualTo: 'true').snapshots(),
          // stream: db.collection('resep').snapshots(),
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
                        });
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
    return SingleChildScrollView(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 9),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(Icons.arrow_back),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => navAdmin()));
                      },
                      child: const Text(
                        'Kembali',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        primary: Colors.orange,
                      ),
                    ),
                  ],
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
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          'Bahan: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          (documentSnapshot!['bahan']),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Cara Pembuatan: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          (documentSnapshot!['cara']),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showBottomSheet(BuildContext context, bool isUpdate, DocumentSnapshot? documentSnapshot) {
  // Added the isUpdate argument to check if our item has been updated
  return Padding(
    padding: const EdgeInsets.only(top: 9),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => tampilTrueAdmin()));
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
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    'Bahan: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (documentSnapshot!['bahan']),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Cara Pembuatan: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (documentSnapshot!['cara']),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
