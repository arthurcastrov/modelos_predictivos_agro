import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:modelos_predictivos_agro/services/authentication.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: const Text(
          'Modelos predictivos',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
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
            children: const [
              UserAccountsDrawerHeader(
                  currentAccountPicture:
                      CircleAvatar(backgroundColor: Colors.amber),
                  accountName: Text("Usuario"),
                  accountEmail: Text("correo.corre@empresa.com")),
              DrawerHeader(
                child: Text(
                  'Titulo',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              ListTile(
                title: Text('Opción 1'),
              )
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.65,
              height: 30.0,
            ),
            const Text(
              'Hola',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'A continuación encontrarás las opciones disponbiles de acuerdo a tu suscripción. Puedes acceder a estas mismas opciones desde el menú lateral izquierdo',
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.65,
                height: MediaQuery.sizeOf(context).height * 0.30,
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Card(
                          elevation: 2.0,
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            width: 200.0,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF1F2FF),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  child: Image.asset(
                                    'images/AI_logo.png',
                                    scale: 10.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                const Text(
                                  'Predicción de enfermedades',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                      Card(
                          elevation: 2.0,
                          child: Container(
                            width: 200.0,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _pickFiles,
              child: const Text('Seleccionar Imágenes'),
            ),
            const SizedBox(height: 20),
            _selectedFiles != null
                ? Wrap(
                    spacing: 8,
                    children: _selectedFiles!.map((file) {
                      return Column(
                        children: [
                          Image.memory(file.bytes!, width: 100, height: 100),
                          Text(file.name),
                        ],
                      );
                    }).toList(),
                  )
                : const Text('No se han seleccionado imágenes.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              // _uploadFiles,
              child: const Text('Subir Imágenes'),
            ),
          ],
        ),
      ),
    );
  }
}
