import 'package:hakuna_matata/routes/myroutes.dart';
import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('registro'),
        ),
      ),
    );
  }
}