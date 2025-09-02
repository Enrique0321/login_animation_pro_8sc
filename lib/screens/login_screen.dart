import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    //Para obtener el tamaño de pantalla de dispositivo
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          //Axis o eje vertical
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              //Ancho de la pantalla calculado por MQ
              width: size.width,
              height: 200,

              child: RiveAnimation.asset('animated_login_character.riv'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.mail),
                border: OutlineInputBorder(
                  //Bordes ciruclares
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              //Para que se oculte la contraseña
              obscureText: !isPasswordVisible,

              ///Nueva propiedad
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock),
                //Nuevo icono para mostrar u ocultar la contraseña
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  //Bordes ciruclares
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width,
              child: const Text(
                "Forgot your Password?",
                textAlign: TextAlign.right,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
