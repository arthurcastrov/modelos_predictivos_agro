import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
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
        // elevation: 2.0,
        // backgroundColor: Colors.white,
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
            ),
          );
        }),
      ),
      drawer: Drawer(
          child: ListView(
        children: const [
          DrawerHeader(child: Text('Titulo')),
          ListTile(
            title: Text('Opción 1'),
          )
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
