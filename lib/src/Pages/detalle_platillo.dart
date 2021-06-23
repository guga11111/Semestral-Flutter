import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:io' as Io;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semestral_flutter/src/Pages/eliminar_page.dart';
//import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';
import 'package:semestral_flutter/src/Pages/registro_page.dart';
import 'package:semestral_flutter/src/Pages/secciones_page.dart';

class DetallePage extends StatefulWidget {
  final String seccion;
  const DetallePage({Key key, this.seccion}) : super(key: key);
  @override
  _DetallePageState createState() => _DetallePageState(seccion: this.seccion);
}

class _DetallePageState extends State<DetallePage> {
  String seccion;
  _DetallePageState({this.seccion});
  PickedFile imageFile;
  String img = '';

  String _ingredientes = '';
  String _precio = '';
  String _nombre = '';
  File imageResized;
  String photoBase64;
  String base64data;

  Future _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(ImageSource.camera);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        body: ListView(
          children: <Widget>[
            _card(context),
            SizedBox(
              height: 50,
            ),
          ],
        ));
  }

  Widget _card(BuildContext context) {
    final card = Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: (imageFile == null)
                    ? Text("Choose Image")
                    : Image.file(File(imageFile.path)),
              ),
              FlatButton(
                  child: Text('Foto'),
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  height: 40,
                  onPressed: () {
                    _showChoiceDialog(context);
                    /* Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListaPedidos())); */
                  }),
              ListTile(
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Nombre del platillo',
                  ),
                  onChanged: (valor) => setState(() {
                    _nombre = valor;
                  }),
                ),
              ),
              ListTile(
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Precio del platillo',
                  ),
                  onChanged: (valor) => setState(() {
                    _precio = valor;
                  }),
                ),
              ),
              ListTile(
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Ingredientes',
                  ),
                  onChanged: (valor) => setState(() {
                    _ingredientes = valor;
                  }),
                ),
              ),
              FlatButton(
                  child: Text('Guardar'),
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  height: 40,
                  onPressed: () {
                    collection();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Se Agregó")));
                  }),
            ],
          ),
          Container(padding: EdgeInsets.all(5.0), child: Text(''))
        ]));

    return Container(
      margin: const EdgeInsets.all(
          30), //Guga, si no te sale centrado es por esto xd
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

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegistroPage()));
  }

  void _openCamera(ImageSource source) async {
    /* final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    ); */
    PickedFile imageFile2 =
        await ImagePicker().getImage(source: ImageSource.camera);

    Uint8List bytes = await imageFile2.readAsBytes();
    String base64data = base64.encode(bytes);
    print(base64data);
    img = base64data;

    setState(() {
      imageFile = imageFile2;
    });
  }

  void _openGallery(BuildContext context) async {
    final imageFile2 = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    Uint8List bytes = await imageFile2.readAsBytes();
    String base64data = base64.encode(bytes);
    img = base64data;
    print(base64data);

    setState(() {
      imageFile = imageFile2;
    });
  }

  collection() {
    Firebase.initializeApp();
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    Firebase.initializeApp();

    //firebaseUser.uid

    firestoreInstance.collection('platillos').doc(_nombre).set({
      "Ingredientes": _ingredientes,
      "Precio": _precio,
      "Nombre": _nombre,
      "Seccion": seccion,
      "Img": img,
    }).then((_) {
      print("success!");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EliminarPage(
                seccion: seccion,
              )));
    });
  }
}
