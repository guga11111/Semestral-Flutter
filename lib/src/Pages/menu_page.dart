import 'dart:convert';
import 'dart:io' as Io;
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

String nombre, precio, img, ingredientes, carri = "", carro = "";
dynamic newimage;

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: const Text('Menú'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            //ScaffoldMessenger.of(context).showSnackBar(
            //  const SnackBar(content: Text('This is a snackbar')));
            carrito(context, carro);
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
                                      carri = document['Nombre'];
                                      carro += carri;
                                      //_navigateToNextScreen(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(" Agregado al carrito: " +
                                            carro +
                                            " - "),
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

  Widget _cardCarrito(BuildContext context) {
    final card = StreamBuilder(
      stream: FirebaseFirestore.instance.collection('caldos').snapshots(),
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

                        /* Container(
                            padding: EdgeInsets.all(20.0),
                            width: 100,
                            height: 100,
                            decoration: new BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(10),
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage(
                                      'lib/src/images/pozole_acapulco.jpg')),
                            )), */
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '   ' + document['Nombre'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.redAccent,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                '   ' + document['Precio'],
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                '   ' + document['Ingredientes'],
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
                                    //_navigateToNextScreen(context);
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
    );
  }
}

void carrito(BuildContext context, String val) {
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => CarritoPage(carrito: val)));
}
