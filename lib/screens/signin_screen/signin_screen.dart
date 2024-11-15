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
  // Future<void> sigInWithMicrosoft() async {
  //   final firebaseAuth = FirebaseAuth.instance;
  //   try {
  //     // Uso el parametro setCustomParameters para pasarle el tenant de ADL porque pr default autentica con commons y asi la app de Azure debe ser publica
  //     await firebaseAuth.signInWithPopup(
  //       OAuthProvider('microsoft.com').setCustomParameters(
  //           {'tenant': '6f5b9b62-57fa-4941-8cc7-ae166fdb6706'}),
  //     );
  //     if (firebaseAuth.currentUser != null) {
  //       print(firebaseAuth.currentUser);
  //       // ignore: use_build_context_synchronously
  //       context.go('/home_screen');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
              const Text(
                'Iniciar sesión',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Hola, por favor inicia sesión con tu cuenta corporativa',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              FilledButton.icon(
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(250.0, 35.0),
                  ),
                ),
                onPressed: () {
                  // sigInWithMicrosoft();
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
