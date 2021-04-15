import 'package:flutter/material.dart';
import 'package:semestral_flutter/src/Pages/alert_page.dart';
import 'package:semestral_flutter/src/Pages/avatar_page.dart';
import 'package:semestral_flutter/src/Pages/inicio_sesion.dart';
import 'package:semestral_flutter/src/Pages/home_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => InicioSesion(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => HomePage(),
  };
}
