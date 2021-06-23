import 'dart:convert';
import 'dart:io' as Io;
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/detalle_platillo.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

String nombre;
dynamic newimage;

class EliminarPage extends StatefulWidget {
  final String seccion;
  const EliminarPage({Key key, this.seccion}) : super(key: key);
  @override
  _MenuPageState createState() => _MenuPageState(seccion: this.seccion);
}

class _MenuPageState extends State<EliminarPage> {
  final firestoreInstance = FirebaseFirestore.instance;
  String seccion;
  _MenuPageState({this.seccion});

  CollectionReference users =
      FirebaseFirestore.instance.collection('platillos');

  Future<void> deleteUser() {
    return users
        .doc(nombre)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
          title: Text("$seccion"),
          backgroundColor: Colors.orange[400],
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Carrito',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Detalle producto')));
                detalle(context, seccion);
              },
            ),
          ]),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('platillos')
            .where('Seccion', isEqualTo: seccion)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('');
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              newimage = Base64Decoder().convert(document['Img']);
              //return Text(document['Nombre']);
              return Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(6.0),
                  margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 130),
                          ),
                          Image.memory(
                            newimage,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            constraints: BoxConstraints(maxWidth: 180),
                            padding: EdgeInsets.all(0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document['Nombre'],
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.redAccent,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  document['Precio'] + " pesos",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  document['Ingredientes'],
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                FlatButton(
                                    child: Text('Eliminar'),
                                    textColor: Colors.orange[400],
                                    color: Colors.white24,
                                    height: 10,
                                    onPressed: () {
                                      nombre = document['Nombre'];
                                      //_navigateToNextScreen(context);
                                      deleteUser();
                                    })
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
            }).toList(),
          );
        },
      ),
    );
  }
}

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> deleteUser() {
  return users
      .doc('ABC123')
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}

void detalle(BuildContext context, String val) {
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => DetallePage(seccion: val)));
}
