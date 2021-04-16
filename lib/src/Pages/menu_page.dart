import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/carrito_page.dart';
import 'package:semestral_flutter/src/Pages/lista_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        body: ListView(children: <Widget>[
          new Row(
            children: <Widget>[],
          ),
          _cardCarrito(context),
          _cardCarrito2(context),
          _cardCarrito3(context),
          _cardCarrito4(context),
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
                Container(
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
                        '   Arrachera',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.redAccent),
                      ),
                      Text(
                        '   700 Pesos',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      Text(
                        '   Ingredientes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      FlatButton(
                          child: Text('Agregar al carrito'),
                          textColor: Colors.orange[400],
                          color: Colors.white24,
                          height: 10,
                          onPressed: () {
                            _navigateToNextScreen(context);
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

  Widget _cardCarrito2(BuildContext context) {
    final card = Container(
        padding: EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Column(
              children: [
                Container(
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
                      ),
                      FlatButton(
                          child: Text('Agregar al carrito'),
                          textColor: Colors.orange[400],
                          color: Colors.white24,
                          height: 10,
                          onPressed: () {
                            _navigateToNextScreen(context);
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

  Widget _cardCarrito3(BuildContext context) {
    final card = Container(
        padding: EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Column(
              children: [
                Container(
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
                        '   Sopa de champiñones',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.redAccent),
                      ),
                      Text(
                        '   599 Pesos',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      Text(
                        '   Ingredientes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      FlatButton(
                          child: Text('Agregar al carrito'),
                          textColor: Colors.orange[400],
                          color: Colors.white24,
                          height: 10,
                          onPressed: () {
                            _navigateToNextScreen(context);
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

  Widget _cardCarrito4(BuildContext context) {
    final card = Container(
        padding: EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Column(
              children: [
                Container(
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
                        '   Pizza',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.redAccent),
                      ),
                      Text(
                        '   340 Pesos',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      Text(
                        '   Ingredientes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      FlatButton(
                          child: Text('Agregar al carrito'),
                          textColor: Colors.orange[400],
                          color: Colors.white24,
                          height: 10,
                          onPressed: () {
                            _navigateToNextScreen(context);
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

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CarritoPage()));
  }
}
