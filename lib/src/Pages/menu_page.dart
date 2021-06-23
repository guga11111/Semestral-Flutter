import 'dart:convert';
import 'dart:io' as Io;
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';

import 'inicio_sesion.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

String converter, carri = "", carro;
int total = 0, precio, va;
dynamic newimage;

class MenuPage extends StatefulWidget {
  final String user;
  final String carro;

  final int total;

  const MenuPage({Key key, this.user, this.total, this.carro})
      : super(key: key);
  @override
  _MenuPageState createState() =>
      _MenuPageState(user: this.user, total: this.total, carro: this.carro);
}

class _MenuPageState extends State<MenuPage> {
  String user;
  String carro;
  int total;

  final firestoreInstance = FirebaseFirestore.instance;
  _MenuPageState createState() => _MenuPageState();
  _MenuPageState({this.user, this.total, this.carro});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: const Text('Menú'),
          backgroundColor: Colors.orange[400],
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Cerrar sesión',
              onPressed: () async {
                carro = "";
                total = 0;
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => InicioPage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              tooltip: 'Carrito',
              onPressed: () {
                if (carro == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text("Tienes que agregar algo al carrito para acceder"),
                  ));
                } else {
                  carrito(context, carro, total, user);
                }
                //ScaffoldMessenger.of(context).showSnackBar(
                //  const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ]),
      backgroundColor: Colors.orange[200],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('platillos').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('no value');
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
                                    child: Text('Agregar al carrito'),
                                    textColor: Colors.orange[400],
                                    color: Colors.white24,
                                    height: 10,
                                    onPressed: () {
                                      converter = document['Precio'];
                                      precio = int.parse(converter);
                                      if (total != null) {
                                        total = precio + total;
                                      }
                                      if (total == null) {
                                        total = 0;
                                      }

                                      print(total);
                                      print(carro);
                                      carri = document['Nombre'];
                                      carro = carro + carri + "\n";
                                      print(carro);

                                      //_navigateToNextScreen(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            " Agregado al carrito: " + carro),
                                      ));
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

void carrito(BuildContext context, String val, int tot, String us) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => CarritoPage(carrito: val, total: tot, user: us)));
}
