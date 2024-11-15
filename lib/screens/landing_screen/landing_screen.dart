import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modelos_predictivos_agro/screens/home_screen/home_screen.dart';
import 'package:modelos_predictivos_agro/screens/prediccion_enfermedades_screen/prediccion_enfermedades_screen.dart';
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
      const Center(child: Text('Visualización Precio del Arroz')), // Página 2
    ];
  }

  // Cargar imagenes a la aplicación
  List<PlatformFile>? _selectedFiles;
  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _selectedFiles = result.files;
      });
      print(result);
    }
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
                  accountEmail:
                      Text(_firebaseAuth.currentUser!.email.toString())),
              // const DrawerHeader(
              //   child: Text(
              //     'Titulo',
              //     style: TextStyle(
              //       fontSize: 20.0,
              //     ),
              //   ),
              // ),
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
                onTap: () {},
              )
            ],
          )),
      body: _pages[_currentPage],
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       SizedBox(
      //         width: MediaQuery.sizeOf(context).width * 0.65,
      //         height: MediaQuery.sizeOf(context).height * 0.10,
      //       ),
      //       const Text(
      //         'Hola',
      //         style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      //       ),
      //       const Text(
      //         'A continuación encontrarás las opciones disponbiles de acuerdo a tu suscripción. Puedes acceder a estas mismas opciones desde el menú lateral izquierdo',
      //         style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
      //       ),
      //       const SizedBox(
      //         height: 50.0,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: SizedBox(
      //           width: MediaQuery.sizeOf(context).width * 0.65,
      //           height: MediaQuery.sizeOf(context).height * 0.33,
      //           child: Center(
      //             child: ListView(
      //               shrinkWrap: true,
      //               scrollDirection: Axis.horizontal,
      //               children: [
      //                 Card(
      //                     elevation: 2.0,
      //                     child: _cardContainer(
      //                         'PREDICCIÓN DE ENFERMEDADES',
      //                         'Módelo de inteligencia artifical para predecir enferemedades de palma',
      //                         FontAwesomeIcons.spider)),
      //                 Card(
      //                     elevation: 2.0,
      //                     child: _cardContainer(
      //                         'VISUALIZACIÓN PRECIO DEL ARROZ',
      //                         'Módelo de inteligencia artifical que predice el precio de diferentes tipos de arroz',
      //                         FontAwesomeIcons.chartLine)),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       // ElevatedButton(
      //       //   onPressed: _pickFiles,
      //       //   child: const Text('Seleccionar Imágenes'),
      //       // ),
      //       // const SizedBox(height: 20),
      //       // _selectedFiles != null
      //       //     ? Wrap(
      //       //         spacing: 8,
      //       //         children: _selectedFiles!.map((file) {
      //       //           return Column(
      //       //             children: [
      //       //               Image.memory(file.bytes!, width: 100, height: 100),
      //       //               Text(file.name),
      //       //             ],
      //       //           );
      //       //         }).toList(),
      //       //       )
      //       //     : const Text('No se han seleccionado imágenes.'),
      //       // const SizedBox(height: 20),
      //       // ElevatedButton(
      //       //   onPressed: () {},
      //       //   // _uploadFiles,
      //       //   child: const Text('Subir Imágenes'),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }

  // Construcción de las card
  // Container _cardContainer(
  //     String textCard, String descriptionCard, IconData iconCard) {
  //   return Container(
  //     padding: const EdgeInsets.all(15.0),
  //     width: 200.0,
  //     decoration: const BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         CircleAvatar(
  //           radius: 20.0,
  //           backgroundColor: const Color(0xFFE5F4FF),
  //           child: Icon(
  //             iconCard,
  //             color: Colors.blue,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 15.0,
  //         ),
  //         Text(
  //           textCard,
  //           style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
  //         ),
  //         const SizedBox(
  //           height: 15.0,
  //         ),
  //         Text(
  //           descriptionCard,
  //           style: const TextStyle(
  //               fontSize: 11.0,
  //               fontWeight: FontWeight.normal,
  //               color: Colors.grey),
  //         ),
  //         const SizedBox(
  //           height: 20.0,
  //         ),
  //         Align(
  //           alignment: Alignment.center,
  //           child: FilledButton(
  //             style: const ButtonStyle(
  //               minimumSize: WidgetStatePropertyAll(
  //                 Size(100.0, 30.0),
  //               ),
  //             ),
  //             onPressed: () {},
  //             child: const Text(
  //               'Entrar',
  //               style: TextStyle(fontSize: 12.0),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
