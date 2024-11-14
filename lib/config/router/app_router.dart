import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:modelos_predictivos_agro/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/signin_screen',
  redirect: (context, GoRouterState state) {
    // Obtener el usuario autenticado
    final isAuthenticated = FirebaseAuth.instance.currentUser != null;

    // Redirigir a la pantalla de inicio de sesión si no esta autenticado
    if (!isAuthenticated) {
      return '/signin_screen';
    }

    // Si el usuario ya está autenticado se redirige al home
    if (isAuthenticated) {
      // Redirigir al home
      return '/home_screen';
    }

    // Si ninguna condición se cumple, permite la navegación normal
    return null;
  },
  routes: [
    GoRoute(
      path: '/signin_screen',
      name: SigninScreen.name,
      builder: (context, state) => const SigninScreen(),
    ),
    GoRoute(
      path: '/home_screen',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
