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

String nombre;
String id;

dynamic newimage;

class PedidosPage extends StatefulWidget {
  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  final firestoreInstance = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('pedidos');

  Future<void> deleteUser() {
    return users
        .doc(nombre)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> entregado() {
    return users
        .doc(id)
        .update({'Estatus': 'Entregado'})
        .then((value) => print("Estatus actualizado"))
        .catchError((error) => print("Actualización fallida: $error"));
  }

  Future<void> cancelado() {
    return users
        .doc(id)
        .update({'Estatus': 'Cancelado'})
        .then((value) => print("Estatus actualizado"))
        .catchError((error) => print("Actualización fallida: $error"));
  }

  Future<void> proceso() {
    return users
        .doc(id)
        .update({'Estatus': 'En proceso'})
        .then((value) => print("Estatus actualizado"))
        .catchError((error) => print("Actualización fallida: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        backgroundColor: Colors.orange[400],
        /* actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              tooltip: 'Carrito',
              onPressed: () {
                //ScaffoldMessenger.of(context).showSnackBar(
                //  const SnackBar(content: Text('This is a snackbar')));
               // carrito(context, carro, total);
              },
            ),
          ]*/
      ),
      backgroundColor: Colors.orange[200],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('pedidos').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('no value');
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              //return Text(document['Nombre']);
              return Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.only(left: 70, right: 70, top: 25),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            constraints: BoxConstraints(maxWidth: 200),
                            padding: EdgeInsets.all(0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Platillos",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  document['Productos'],
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.redAccent,
                                      decoration: TextDecoration.none),
                                ),
                                Divider(
                                  thickness: 5,
                                ),
                                Text(
                                  "Precio",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  document['Total'].toString() + " pesos",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Divider(
                                  thickness: 5,
                                ),
                                Text(
                                  "Usuario",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  document['Usuario'].toString(),
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Divider(
                                  thickness: 5,
                                ),
                                Text(
                                  "Id Pedido",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  document['Id'].toString(),
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Divider(
                                  thickness: 5,
                                ),
                                Text(
                                  "Estatus",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  document['Estatus'].toString() + "",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Divider(
                                  thickness: 5,
                                ),
                                Text(
                                  "Dirección",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  document['Direccion'].toString(),
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Divider(
                                  thickness: 5,
                                ),
                                Text(
                                  "Notas de envio",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  document['Notas de envio'].toString(),
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                Divider(
                                  thickness: 5,
                                ),
                                Row(children: <Widget>[
                                  FlatButton(
                                      child: Text('Entregado'),
                                      textColor: Colors.green[400],
                                      color: Colors.white24,
                                      height: 10,
                                      onPressed: () {
                                        id = document['Id'];
                                        //_navigateToNextScreen(context);
                                        entregado();
                                      }),
                                  FlatButton(
                                      child: Text('Cancelado'),
                                      textColor: Colors.red[400],
                                      color: Colors.white24,
                                      height: 10,
                                      onPressed: () {
                                        id = document['Id'];
                                        //_navigateToNextScreen(context);
                                        cancelado();
                                      }),
                                ])
                              ],
                            ),
                          ),
                          FlatButton(
                              child: Text('En proceso'),
                              textColor: Colors.orange[400],
                              color: Colors.white24,
                              height: 10,
                              onPressed: () {
                                id = document['Id'];
                                //_navigateToNextScreen(context);
                                proceso();
                              }),
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

void carrito(BuildContext context, String val) {
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => CarritoPage(carrito: val)));
}
