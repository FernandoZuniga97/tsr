import 'package:hakuna_matata/routes/myroutes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key,});
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center( child: Text('Login')),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child:Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width+20,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background-2.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width+20,
                    child:Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background-2.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
                Container(
                  padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Color.fromRGBO(196, 135, 198, .3)
                            ))
                          ),
                  child: TextField(
                        controller: emailController,
                        maxLength: 30,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          labelStyle: TextStyle(color: Colors.purple),
                          icon: Icon(Icons.email),
                          border: UnderlineInputBorder(),
                          
                        ),
                      ),
          ),
                      //custom pa que sea privado
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(
                            color: Color.fromRGBO(196, 135, 198, .3)
                          ))
                        ),
                      child: Custompass(
                        controller: passwordController,
                        obscureText: true,
                      ),
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
            ]
               // 
              
                  
            //
          ),
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
        shape: const StadiumBorder(),
        backgroundColor:  const Color.fromRGBO(49, 39, 79, 1), // color de fondo
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
  final bool obscureText;

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
        labelStyle: const TextStyle(color: Colors.purple),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              }); 
            },
            icon: Icon( obscureText ? Icons.visibility : Icons.visibility_off)),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}