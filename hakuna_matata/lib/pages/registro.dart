import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  Registro({super.key,});

  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final telController = TextEditingController();
  final apellidoController = TextEditingController();
  final passwordController = TextEditingController();
  final confipasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        backgroundColor: const Color.fromRGBO(49, 39, 79, 1)
      ),
      body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nombreController,
                        maxLength: 40,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'El nombre es obligatorio';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text('Nombre'),
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        maxLength: 60,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'El correo es obligatorio';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        maxLength: 20,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'La contraseña es obligatoria';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text('Contraseña'),
                          icon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        controller: confipasswordController,
                        maxLength: 20,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'La confirmación de la contraseña es obligatoria';
                          }
                          else if (confipasswordController.text != passwordController.text) {
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text('Confirmar contraseña'),
                          icon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        controller: telController,
                        maxLength: 10,
                        validator: (value) {
                          if (value!.isEmpty ) {
                            return 'El numero es obligatorio';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text('Telefono'),
                          icon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SecondaryButton(
                text: ' Registrarse',
                onPressed: () {
                if (formKey.currentState!.validate()) {
              print('Nombre: ' + nombreController.text);
              print('Email: ' +emailController.text);
              print('Contraseña: ' +passwordController.text);
              print('Telefono: ' +telController.text);
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Se registro exitosamente!')),
              );
    }
    },
    ),
              ],
            ),
          ),
          
        ),
        
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
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(49, 39, 79, 1),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}