import 'package:hakuna_matata/routes/myroutes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home pages'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              text: 'iniciar sesion',
              onPressed: () {
                // * Navegación a otra pantalla
                Navigator.pushNamed(context, MyRoutes.start.name);
              },
            ),
            SecondaryButton(
              text: ' Registro',
              onPressed: () {
                // * Navegación a otra pantalla y reemplazar
                //* la pila de navegación
                Navigator.pushNamed(context, MyRoutes.registro.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// *  Otros widgets

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // color de fondo
        foregroundColor: Colors.white, // color de texto
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.text, this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}