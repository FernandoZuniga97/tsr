import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({super.key,});
  static const List<Map<String, dynamic>> chats = [
    {
      "nombre": "Popeye el pollo chuco",
      "mensaje": "u wan a querer chilation?",
      "hora": "23:00",
      "foto": FlutterLogo(),
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
    return PopScope( 
      canPop: false,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
  title: const Row(
    children: [
      FlutterLogo(),
      SizedBox(width: 10.0),
      Text('Chats', style: TextStyle(color: Colors.white)),
    ],
  ),
  backgroundColor: const Color.fromARGB(255, 97, 12, 167),
  elevation: 0,
),
  body: Column(
  children: [
    Row(
      children: [
        InkWell(
          onTap: () 
          {
          },
          child: const Icon(Icons.search),
        ),
        const Expanded(
          child:  TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Search',
              border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
          ),
        ),
      ],
    ),
    Expanded(
      child: ListView.builder(
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
      ),
    ),
  ],
),

  bottomNavigationBar: BottomAppBar(
  color: Colors.white,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children:[
      SizedBox(
        width: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {
              },
            ),
            const Text('Chats', style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
      SizedBox(
        width: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.video_call),
              onPressed: () {
              },
            ),
            const Text('Calls', style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
      SizedBox(
        width: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.group),
              onPressed: () {
              },
            ),
            const Text('People', style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
      SizedBox(
        width: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.pages),
              onPressed: () {
              },
            ),
            const Text('Pages', style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    ],
  ),
),
        ),
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.nombre,
    required this.mensaje,
    required this.hora,
    required this.foto,
  }) : super(key: key);

  final String nombre;
  final String mensaje;
  final String hora;
  final Widget foto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(
            mensaje,
            style: const TextStyle(color: Colors.grey),
          ),
          leading: CircleAvatar(
            child: foto,
          ),
          trailing: Text(
            hora,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}