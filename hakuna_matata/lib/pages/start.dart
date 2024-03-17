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
            title: const Text('Chats', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            backgroundColor: const Color.fromARGB(255, 97, 12, 167),
            elevation: 0,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.message), text: 'Mensajes'),
                Tab(icon: Icon(Icons.access_time), text: 'Activos'),
                Tab(icon: Icon(Icons.call), text: 'Llamadas'),
                Tab(icon: Icon(Icons.group), text: 'Grupos'),
              ],
              labelColor: Color.fromARGB(255, 255, 254, 255),
              unselectedLabelColor: Color.fromARGB(255, 0, 0, 0), 
            ),
          ),
          body: ListView.builder(
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
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                  },
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