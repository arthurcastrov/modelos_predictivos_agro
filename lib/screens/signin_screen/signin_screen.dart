import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modelos_predictivos_agro/services/authentication.dart';

class SigninScreen extends StatefulWidget {
  static const String name = 'signin_screen';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Icon(Icons.abc_outlined)),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          width: MediaQuery.sizeOf(context).width * 0.30,
          height: MediaQuery.sizeOf(context).width * 0.10,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hola, por favor inicia sesión con tu cuenta corporativa',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              FilledButton.icon(
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(250.0, 35.0),
                  ),
                ),
                onPressed: () {
                  SignInWithProvider().sigInWithMicrosoft(context);
                },
                label: const Text('Iniciar sesión'),
                icon: const FaIcon(
                  FontAwesomeIcons.microsoft,
                  size: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
