import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';

class CarritoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
                Container(
                    padding: EdgeInsets.all(50.0),
                    width: 100,
                    height: 100,
                    decoration: new BoxDecoration(
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(10),
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage(
                              'lib/src/images/pozole_acapulco.jpg')),
                    )),
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
                        '   Pozole',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.redAccent),
                      ),
                      Text(
                        '   200 Pesos',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      Text(
                        '   Ingredientes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
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
      margin: EdgeInsets.only(left: 30, right: 30, top: 40),
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
