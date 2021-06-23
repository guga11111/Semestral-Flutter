import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';
import 'package:semestral_flutter/src/Pages/menu_page.dart';
import 'dart:math';

class CarritoPage extends StatefulWidget {
  final String carrito;
  final int total;
  final String user;

  const CarritoPage({Key key, this.carrito, this.total, this.user})
      : super(key: key);
  @override
  _CarritoPageState createState() => _CarritoPageState(
      carrito: this.carrito, total: this.total, user: this.user);
}

class _CarritoPageState extends State<CarritoPage> {
  String _direccion = '';
  String _datos = '';
  String carrito;
  String user;
  int total;

  String id;
  _CarritoPageState({this.carrito, this.total, this.user, this.change});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Carrito'),
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
        body: ListView(children: <Widget>[
          new Row(
            children: <Widget>[],
          ),
          _cardCarrito(),
          _card(context),
          SizedBox(
            height: 30,
          ),
        ]));
  }

  Widget _card(BuildContext context) {
    final card = Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                trailing: Icon(Icons.place),
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Dirección',
                  ),
                  onChanged: (valor) => setState(() {
                    _direccion = valor;
                  }),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.note_add_rounded),
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Notas de envío',
                  ),
                  onChanged: (valor) => setState(() {
                    _datos = valor;
                  }),
                ),
              ),
              FlatButton(
                  child: Text('Ordenar YA!'),
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  height: 40,
                  onPressed: () {
                    collection();
                  }),
            ],
          ),
          Container(padding: EdgeInsets.all(5.0), child: Text(''))
        ]));

    return Container(
      margin: const EdgeInsets.all(
          20), //Guga, si no te sale centrado es por esto xd
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 10,
                offset: Offset(2.0, 10.0))
          ],
          color: Colors.white),
    );
  }

  Widget _cardCarrito() {
    final card = Container(
        padding: EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Column(
              children: [],
            ),
            Column(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 160),
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Productos',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        carrito,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.redAccent),
                      ),
                      Text(
                        "Total",
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        total.toString() + "pesos",
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(left: 30, right: 30, top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 1),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(2.0, 14.0))
          ]),
    );
  }

  collection() {
    Firebase.initializeApp();
    final firestoreInstance = FirebaseFirestore.instance;
    Firebase.initializeApp();

    //firebaseUser.uid
    var random = getRandomString(5);
    id = random;
    print(id);
    print(user);
    print(_direccion);
    print(_datos);

    firestoreInstance.collection('pedidos' + user).doc(id).set({
      "Productos": carrito,
      "Total": total,
      "Direccion": _direccion,
      "Notas de envio": _datos,
      "Nombre": id
    }).then((_) {
      print("success!");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Se agregó el pedido")));
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MenuPage(user: user, carro: "", total: 0)));
    });
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
