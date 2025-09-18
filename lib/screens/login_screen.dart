import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async'; // timer

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Cerebro de la lógica de animación
  StateMachineController? controller;

  SMIBool? isChecking; // Activar al Oso chismoso
  SMIBool? isHandsUp; // Se tapa los ojos
  SMITrigger? trigSuccess; // Se emociona
  SMITrigger? trigFail; // Se pone muy sad

  // Variable para mover los ojos:
  SMINumber? numLook;

  // Control visibilidad contraseña
  bool isPasswordVisible = false;

  // Controllers de los TextFields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  //
  Timer? typingTimer;

  // Datos correctos (para la práctica)
  final String correctEmail = "osopech@gmail.com";
  final String correctPassword = "12345";

  @override
  void initState() {
    super.initState();

    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        if (isChecking != null) isChecking!.change(false);
      }
    });

    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        if (isHandsUp != null) isHandsUp!.change(true);
      } else {
        if (isHandsUp != null) isHandsUp!.change(false);
      }
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    typingTimer?.cancel();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == correctEmail && password == correctPassword) {
      // Oso feliz
      trigSuccess?.fire();
    } else {
      // Oso triste
      trigFail?.fire();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width,
                height: 200,
                child: RiveAnimation.asset(
                  'animated_login_character.riv',
                  stateMachines: ["Login Machine"],
                  onInit: (artboard) {
                    controller = StateMachineController.fromArtboard(
                      artboard,
                      "Login Machine",
                    );
                    if (controller == null) return;
                    artboard.addController(controller!);
                    isChecking = controller!.findSMI('isChecking');
                    isHandsUp = controller!.findSMI('isHandsUp');
                    trigSuccess = controller!.findSMI('trigSuccess');
                    trigFail = controller!.findSMI('trigFail');
                    numLook = controller!.findSMI('numLook');
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Email
              TextField(
                controller: emailController,
                focusNode: emailFocusNode,
                onChanged: (value) {
                  if (isHandsUp != null) {
                    isHandsUp!.change(false);
                  }
                  if (isChecking == null) return;
                  isChecking!.change(true);

                  if (numLook != null) {
                    double lookValue = (value.length.clamp(0, 80)) * 1.5;
                    numLook!.change(lookValue);
                  }

                  typingTimer?.cancel();
                  typingTimer = Timer(const Duration(seconds: 2), () {
                    if (isChecking != null) isChecking!.change(false);
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Password
              TextField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                onChanged: (value) {
                  if (isChecking != null) {
                    isChecking!.change(false);
                  }
                  if (isHandsUp == null) return;
                  isHandsUp!.change(true);
                },
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
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
              const SizedBox(height: 10),
              MaterialButton(
                minWidth: size.width,
                height: 50,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: validateLogin, // aquí la validación
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
