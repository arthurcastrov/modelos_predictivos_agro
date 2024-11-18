import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modelos_predictivos_agro/screens/home_screen/home_screen.dart';
import 'package:modelos_predictivos_agro/screens/prediccion_enfermedades_screen/prediccion_enfermedades_screen.dart';
import 'package:modelos_predictivos_agro/screens/prediccion_precio_arroz_screen/prediccion_precio_arroz_screen.dart';
import 'package:modelos_predictivos_agro/services/authentication.dart';

class LandingScreen extends StatefulWidget {
  static const String name = 'landing_screen';
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  // Variable para manejar la página actual

  // Método para cambiar la página
  void _changePage(int index) {
    setState(() {
      _currentPage = index;
    });
    print('Página seleccionada: $_currentPage (${_pages[index]})');
  }

  int _currentPage = 0;
  late List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      EmbededHomeScreen(onPageChange: _changePage), // Página inicial
      const EmbededPrediccionEnfermedades(), // Página 1
      const EmbededPrediccionPrecioArroz(), // Página 2
    ];
  }

  // Future<void> _uploadFiles() async {
  //   if (_selectedFiles != null && _selectedFiles!.isNotEmpty) {
  //     var uri = Uri.parse(
  //         'https://tu-endpoint.com/upload'); // Reemplaza con tu endpoint
  //   } else {
  //     print('No hay archivos seleccionados');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              SignInWithProvider().signOut(context);
            },
            icon: const Icon(Icons.logout_rounded),
            iconSize: 20.0,
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              height: 1.0,
              color: Colors.grey,
            )),
        title: Image.asset(
          'assets/images/ADL_Logo.png',
          height: 25.0,
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu_rounded,
              size: 15.0,
            ),
          );
        }),
      ),
      drawer: Drawer(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.75)),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    '${_firebaseAuth.currentUser!.displayName.toString().split('').first}${_firebaseAuth.currentUser!.displayName.toString().split(' ')[2].split('').first}',
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                accountName:
                    Text(_firebaseAuth.currentUser!.displayName.toString()),
                accountEmail: Text(
                  _firebaseAuth.currentUser!.email.toString(),
                ),
              ),
              ListTile(
                title: const Text('INICIO'),
                leading: const Icon(
                  FontAwesomeIcons.house,
                  size: 15.0,
                ),
                onTap: () {
                  _changePage(0);
                  Navigator.of(context).pop(); // Cierra el Drawer
                },
              ),
              ListTile(
                title: const Text('PREDICCIÓN DE ENFERMEDADES'),
                leading: const Icon(
                  FontAwesomeIcons.spider,
                  size: 15.0,
                ),
                onTap: () {
                  _changePage(1);
                  Navigator.of(context).pop(); // Cierra el Drawer
                },
              ),
              ListTile(
                title: const Text('VISUALIZACIÓN PRECIO DEL ARROZ'),
                leading: const Icon(
                  FontAwesomeIcons.chartLine,
                  size: 15.0,
                ),
                onTap: () {
                  _changePage(2);
                  Navigator.of(context).pop(); // Cierra el Drawer
                },
              )
            ],
          )),
      body: _pages[_currentPage],
    );
  }
}
