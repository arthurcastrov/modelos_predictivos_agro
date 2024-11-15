import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modelos_predictivos_agro/config/router/app_router.dart';
import 'package:modelos_predictivos_agro/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Modelos Predictivos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        drawerTheme: (const DrawerThemeData(
          backgroundColor: Colors.white,
        )),
        scaffoldBackgroundColor: const Color(0xfff4f4f4),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
        primaryColor: const Color(0xFF4547EF),
        filledButtonTheme: const FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Color(0xFF4547EF),
            ),
          ),
        ),
        navigationDrawerTheme: const NavigationDrawerThemeData(
          backgroundColor: Color(0xFF4547EF),
        ),
        listTileTheme: const ListTileThemeData(
          titleTextStyle: TextStyle(fontSize: 10.0),
        ),
      ),
    );
  }
}
