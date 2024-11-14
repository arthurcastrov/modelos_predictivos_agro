import 'package:firebase_auth/firebase_auth.dart';

class SignInWithProvider {
  Future<void> sigInWithMicrosoft(context) async {
    final firebaseAuth = FirebaseAuth.instance;
    try {
      // Uso el parametro setCustomParameters para pasarle el tenant de ADL porque pr default autentica con commons y asi la app de Azure debe ser publica
      await firebaseAuth.signInWithPopup(
        OAuthProvider('microsoft.com').setCustomParameters(
            {'tenant': '6f5b9b62-57fa-4941-8cc7-ae166fdb6706'}),
      );
      if (firebaseAuth.currentUser != null) {
        print(firebaseAuth.currentUser);
        context.go('/home_screen');
      }
    } catch (e) {
      print(e);
    }
  }
}
