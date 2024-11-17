import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widgets_easier/widgets_easier.dart';

class EmbededPrediccionEnfermedades extends StatefulWidget {
  const EmbededPrediccionEnfermedades({super.key});
  @override
  State<EmbededPrediccionEnfermedades> createState() =>
      _EmbededPrediccionEnfermedadesState();
}

class _EmbededPrediccionEnfermedadesState
    extends State<EmbededPrediccionEnfermedades> {
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.65,
            height: MediaQuery.sizeOf(context).height * 0.10,
          ),
          const Text(
            'Predicción de enfermedades en palma',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.65,
            child: const Text(
              'Hemos construido un módelo predictivo que te permitirá detectar de manera anticipada las enfermedades que puedan recaer sobre las palmas, simplemente carga las imagenes que deseas analizar y da click en el botón de análizar.',
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: const ShapeDecoration(
              shape: DashedBorder(
                color: Color(0xFFCCCCCC),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            height: MediaQuery.sizeOf(context).height * 0.20,
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.cloudArrowUp,
                  size: 30.0,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                FilledButton(
                  onPressed: _pickFiles,
                  style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(
                      Size(100.0, 30.0),
                    ),
                  ),
                  child: const Text('Cargar Imágenes'),
                ),
              ],
            ),
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
    );
  }
}
