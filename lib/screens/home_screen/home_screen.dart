import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmbededHomeScreen extends StatefulWidget {
  final void Function(int) onPageChange;

  const EmbededHomeScreen({super.key, required this.onPageChange});

  @override
  State<EmbededHomeScreen> createState() => _EmbededHomeScreenState();
}

class _EmbededHomeScreenState extends State<EmbededHomeScreen> {
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
            'Hola',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            'A continuación, encontrarás las opciones disponbiles de acuerdo a tu suscripción. Puedes acceder a estas mismas opciones desde el menú lateral izquierdo',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.65,
              height: MediaQuery.sizeOf(context).height * 0.33,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                        elevation: 2.0,
                        child: _cardContainer(
                            'PREDICCIÓN DE ENFERMEDADES',
                            'Módelo de inteligencia artifical para predecir enferemedades de palma',
                            FontAwesomeIcons.spider,
                            1)),
                    Card(
                        elevation: 2.0,
                        child: _cardContainer(
                            'VISUALIZACIÓN PRECIO DEL ARROZ',
                            'Módelo de inteligencia artifical que predice el precio de diferentes tipos de arroz',
                            FontAwesomeIcons.chartLine,
                            2)),
                  ],
                ),
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: _pickFiles,
          //   child: const Text('Seleccionar Imágenes'),
          // ),
          // const SizedBox(height: 20),
          // _selectedFiles != null
          //     ? Wrap(
          //         spacing: 8,
          //         children: _selectedFiles!.map((file) {
          //           return Column(
          //             children: [
          //               Image.memory(file.bytes!, width: 100, height: 100),
          //               Text(file.name),
          //             ],
          //           );
          //         }).toList(),
          //       )
          //     : const Text('No se han seleccionado imágenes.'),
          // const SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: () {},
          //   // _uploadFiles,
          //   child: const Text('Subir Imágenes'),
          // ),
        ],
      ),
    );
  }

  // Construcción de las card
  Container _cardContainer(String textCard, String descriptionCard,
      IconData iconCard, int pageIndex) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: 200.0,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: const Color(0xFFE5F4FF),
            child: Icon(
              iconCard,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            textCard,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            descriptionCard,
            style: const TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.center,
            child: FilledButton(
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(
                  Size(100.0, 30.0),
                ),
              ),
              onPressed: () {
                print('Index desde Home_Screen: $pageIndex');
                widget.onPageChange(pageIndex);
              },
              child: const Text(
                'Entrar',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
