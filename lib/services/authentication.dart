import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInWithProvider {
  // Método para autenticar el usuario
  Future<void> sigInWithMicrosoft(BuildContext context) async {
    final firebaseAuth = FirebaseAuth.instance;
    try {
      // Uso el parametro setCustomParameters para pasarle el tenant de ADL porque pr default autentica con commons y asi la app de Azure debe ser publica
      await firebaseAuth.signInWithPopup(
        OAuthProvider('microsoft.com').setCustomParameters(
            {'tenant': '6f5b9b62-57fa-4941-8cc7-ae166fdb6706'}),
      );
      if (firebaseAuth.currentUser != null) {
        // ignore: use_build_context_synchronously
        context.go('/home_screen');
      }
    } catch (e) {
      print(e);
    }
  }

  // Método para desloguear usuario y regresar a la pantalla de login
  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance
        .signOut()
        // ignore: use_build_context_synchronously
        .then((value) => context.go('/signin_screen'));
  }
}
