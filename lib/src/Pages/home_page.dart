import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "lib/src/images/Fondo.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          floatingActionButton: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://www.sosfactory.com/wp-content/uploads/2016/12/mr-bolat-logo.png")))),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            height: 500,
            width: 300,
            margin: const EdgeInsets.all(28),
            child: new Column(
              children: <Widget>[TextField(), TextField(), ButtonBar()],
            ),
          ),
        )
      ],
    );
  }
}
