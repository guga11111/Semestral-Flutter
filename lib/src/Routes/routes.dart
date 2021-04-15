import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/alert_page.dart';
import 'package:semestral_flutter/src/Pages/registro_page.dart';
import 'package:semestral_flutter/src/Pages/inicio_sesion.dart';
import 'package:semestral_flutter/src/Pages/home_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => RegistroPage(), //Aqui inicio de sesión
    'alert': (BuildContext context) => AlertPage(),
    'registro': (BuildContext context) =>
        InicioSesion(), // Aqui debe ir registro xd
    'card': (BuildContext context) => HomePage(),
  };
}
