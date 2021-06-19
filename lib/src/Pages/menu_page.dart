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

String nombre, precio, img, ingredientes;
dynamic newimage;

class MenuPage extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;

  Future getCloudFirestoreUsers() async {
    //assumes you have a collection called "users"
    firestoreInstance.collection("caldos").get().then((querySnapshot) {
      //print(querySnapshot);
      //print("caldos: results: length: " + querySnapshot.docs.length.toString());
      querySnapshot.docs.forEach((value) {
        //print("caldos: results: value");
        //print(value.data());
        nombre = value['Nombre'];
        precio = value['Precio'];
        ingredientes = value['Ingredientes'];
        img = value['Img'];

        newimage = Base64Decoder().convert(img);

        Image.memory(newimage);
      });
    }).catchError((onError) {
      print("getCloudFirestoreUsers: ERROR");
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    getCloudFirestoreUsers();
    return Scaffold(
        backgroundColor: Colors.orange[200],
        body: ListView(children: <Widget>[
          new Row(
            children: <Widget>[],
          ),
          _cardCarrito(context),
          SizedBox(
            height: 30,
          ),
        ]));
  }

  Widget _cardCarrito(BuildContext context) {
    final card = Container(
        padding: EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Column(
              children: [
                Image.memory(newimage, width: 100, height: 100),

                /*  Container(
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
                        '   ' + nombre,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.redAccent),
                      ),
                      Text(
                        '   ' + precio,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      Text(
                        '   ' + ingredientes,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
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
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(left: 30, right: 30, top: 15),
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
}
