import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';

class CarritoPage extends StatefulWidget {
  final String carrito;
  final int total;

  const CarritoPage({Key key, this.carrito, this.total}) : super(key: key);
  @override
  _CarritoPageState createState() =>
      _CarritoPageState(carrito: this.carrito, total: this.total);
}

class _CarritoPageState extends State<CarritoPage> {
  String carrito;
  int total;
  _CarritoPageState({this.carrito, this.total});

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
                ),
              ),
              FlatButton(
                  child: Text('Ordenar YA!'),
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  height: 40,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListaPedidos()));
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
}
