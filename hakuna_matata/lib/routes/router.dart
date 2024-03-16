
import 'package:hakuna_matata/pages/home.dart';
import 'package:hakuna_matata/routes/myroutes.dart';
import 'package:hakuna_matata/pages/registro.dart';
import 'package:hakuna_matata/pages/start.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.home.name: (context) => const Home(),
  MyRoutes.registro.name: (context) => const Registro(),
  MyRoutes.start.name: (context) => const Start(),
};
