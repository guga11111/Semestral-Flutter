import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';
import 'package:semestral_flutter/src/Pages/registro_page.dart';

class DetallePage extends StatefulWidget {
  @override
  _DetallePageState createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  String _ingredientes = '';
  String _precio = '';
  String _nombre = '';
  String _seccion = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        body: ListView(children: <Widget>[
          _card(context),
          SizedBox(
            height: 50,
          ),
        ]));
  }

  Widget _card(BuildContext context) {
    final card = Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          new Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              width: 160.0,
              height: 160.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage(
                          "lib/src/images/pozole_acapulco.jpg")))),
          Column(
            children: <Widget>[
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
                  obscureText: true,
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
              ListTile(
                title: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Sección',
                  ),
                  onChanged: (valor) => setState(() {
                    _seccion = valor;
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
                    /* Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListaPedidos())); */
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

  collection() {
    Firebase.initializeApp();
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    Firebase.initializeApp();

    firestoreInstance.collection(_seccion).doc(firebaseUser.uid).set({
      "Ingredientes": _ingredientes,
      "Precio": _precio,
      "Nombre": _nombre,
      "Seccion": _seccion,
      "Img": "sdvsdmvsvsmovsmdvmosdvmsmovsovmsome",
    }).then((_) {
      print("success!");
    });
  }
}
