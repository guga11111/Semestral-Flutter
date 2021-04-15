import 'package:semestral_flutter/src/Pages/alert_page.dart';
import 'package:semestral_flutter/src/Pages/card_page.dart';
import 'package:semestral_flutter/src/Pages/home_page.dart';
import 'package:semestral_flutter/src/Routes/routes.dart';

//import 'package:componentes/src/pages/homepage_alternativo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'listTile APP',
      debugShowCheckedModeBanner: false,
      //home:HomePage(),
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta : ${settings.name}');
        // Si en caso la ruta no existe puedo redireccionar a una que sea estatica
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      },
    );
  }
}
