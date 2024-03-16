import 'package:hakuna_matata/routes/myroutes.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({super.key,});

static const List<Map<String, dynamic>> chats = [
    {
      "nombre": "Popeye el pollo chuco",
      "mensaje": "u wan a querer chilation?",
      "hora": "23:00",
      "foto":
          FlutterLogo(),
    },
    {
      "nombre": "Pedro Lopez",
      "mensaje": "Vamno a juga",
      "hora": "15:00",
      "foto": FlutterLogo(),
    },
    {
      "nombre": "Luis Perez",
      "mensaje": "volvio tu ex",
      "hora": "09:00",
      "foto": FlutterLogo(),
    },
    {
      "nombre": "Oscar Sanchez",
      "mensaje": "SOAB",
      "hora": "14:30",
      "foto": FlutterLogo(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        if (chats.isEmpty) {
          return const Center(
            child: Text('No hay chats'),
          );
        }

        return ItemChat(
          nombre: chats[index]['nombre']!,
          mensaje: chats[index]['mensaje']!,
          hora: chats[index]['hora']!,
          foto: chats[index]['foto'],
        );
      },
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    super.key,
    required this.nombre,
    required this.mensaje,
    required this.hora,
    required this.foto,
  });

  final String nombre;
  final String mensaje;
  final String hora;
  final Widget foto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        child: ListTile(
          title: Text(nombre),
          subtitle: Text(mensaje),
          leading: foto,
          trailing: Text(hora),
        ),
      ),
    );
  }
}

