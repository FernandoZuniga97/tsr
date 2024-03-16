import 'package:hakuna_matata/routes/myroutes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key,});
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  

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
            TextField(
                  controller: emailController,
                  maxLength: 30,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                //custom pa que sea privado
                Custompass(
                  controller: passwordController,
                  obscureText: true,
                ),
            PrimaryButton(
              text: 'iniciar sesion',
              onPressed: () {
                if (emailController.text.isEmpty || passwordController.text.isEmpty ||  emailController.text != 'fzunigao@unah.hn' || passwordController.text != '123' ) {
                  ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('El correo o/y la contraseña son incorrectos.')));
                  return; //const SnackBar(content: Text('Los campos no pueden estar vacios'));
                }else if( emailController.text == 'fzunigao@unah.hn' && passwordController.text == '123'){
                Navigator.pushNamed(context, MyRoutes.start.name);
                }
                
                
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

class Custompass extends StatefulWidget {
  Custompass({super.key,
  required this.controller,
    this.obscureText = false,
  });
  final TextEditingController controller;
  bool obscureText;

  @override
  State<Custompass> createState() => _CustomInputState();
}

class _CustomInputState extends State<Custompass> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
  
    return TextField(
      
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: const Text('Password'),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              }); 
            },
            icon: Icon( obscureText ? Icons.visibility : Icons.visibility_off)),
        border: const OutlineInputBorder(),
      ),
    );
  }
}