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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
            height: 400,
            child: Stack(
              children: [
                Positioned(
                  top: -40,
                  height: 400,
                  width: width,
                  child:Container(
                    decoration: const BoxDecoration(
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
                    decoration: const BoxDecoration(
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
                    decoration: const BoxDecoration(
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
          //
          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 40),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text("Alcatraz Login", style: TextStyle(color: Color.fromRGBO(49, 39, 79, 1), fontWeight: FontWeight.bold, fontSize: 30)),
      const SizedBox(height: 30),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(
            color: Color.fromRGBO(196, 135, 198, .3)
          ))
        ),
        child: TextField(
          controller: emailController,
          maxLength: 60,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.purple),
            icon: Icon(Icons.email),
            border: UnderlineInputBorder(),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: Custompass(
          controller: passwordController,
          obscureText: true,
          ),
      ),
      PrimaryButton(
        text: 'Iniciar sesión',
        onPressed: () {
          if (emailController.text.isEmpty || passwordController.text.isEmpty ||  emailController.text != 'fzunigao@unah.hn' || passwordController.text != '20212030191' ) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('El correo o/y la contraseña son incorrectos.')),
            );
            return;
          } else if( emailController.text == 'fzunigao@unah.hn' && passwordController.text == '20212030191'){
            Navigator.pushNamed(context, MyRoutes.start.name);
          } 
        },
      ),
      SecondaryButton(
        text: 'Registrate ahora',
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.registro.name);
    },
    ), 
    ],
    ),
    ),
    ],
    ),
    )
    );
    }
    }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, this.onPressed});
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( 
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor:  const Color.fromRGBO(49, 39, 79, 1),
        foregroundColor: Colors.white,
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
  const Custompass({super.key,
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
        icon: const Icon(Icons.lock),
        border: const UnderlineInputBorder(),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              }); 
            },
            icon: Icon( obscureText ? Icons.visibility : Icons.visibility_off)),
      ),
    );
  }
}