import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        body: ListView(children: <Widget>[
          new Row(
        children: <Widget>[
         
        ],
      ),
          _card(),
          _cardt3(),
          SizedBox(
            height: 50,
          ),
        ]));
  }

  Widget _card() {
    final card = Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          
          Column(
            children: <Widget>[
 ListTile(
          leading: Icon(Icons.assistant_photo, color: Colors.cyanAccent),
          title: Text("Pozole"),
          subtitle: Text(
              "200")),
      
  
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

    Widget _cardt3() {
    final card = Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Column(
              children: [
                Container(
                    padding: EdgeInsets.all(50.0),
                    width: 150,
                    height: 150,
                    decoration: new BoxDecoration(
                      //shape: BoxShape.circle,
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
                  padding: EdgeInsets.all(.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre de la persona: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('Felix Miguel Cardenas'),
                      Text(
                        'Oficio: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('Estudiante de la Universidad'),
                      Text('de la Salle Bajío'),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 5),
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
