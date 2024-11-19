import 'package:dotted_line/dotted_line.dart';
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
  int _selectedValue = 1;
  bool _showProgress = false;
  bool _analysisCompleted = false;

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
        _showProgress = false;
      });
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_showProgress);
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   width: MediaQuery.sizeOf(context).width * 0.65,
            //   height: MediaQuery.sizeOf(context).height * 0.10,
            // ),
            SizedBox(
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
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.18,
                    height: 150.0,
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      // physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        RadioListTile(
                            title: const Text('Enfermedad del plumero'),
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            subtitle: const Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text('Incluido en tu suscripción '),
                                Icon(
                                  FontAwesomeIcons.check,
                                  size: 10.0,
                                )
                              ],
                            ),
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            }),
                        RadioListTile(
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          title: const Text('Pudrición del cogollo'),
                          subtitle: const Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text('Requiere suscripción premium '),
                              Icon(
                                FontAwesomeIcons.crown,
                                size: 10.0,
                              )
                            ],
                          ),
                          value: 2,
                          groupValue: _selectedValue,
                          onChanged: null,
                        ),
                        RadioListTile(
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          title: const Text('Marchitez sorpresiva'),
                          subtitle: const Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text('Requiere suscripción premium '),
                              Icon(
                                FontAwesomeIcons.crown,
                                size: 10.0,
                              )
                            ],
                          ),
                          value: 3,
                          groupValue: _selectedValue,
                          onChanged: null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
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
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.grey),
                            minimumSize: WidgetStatePropertyAll(
                              Size(100.0, 30.0),
                            ),
                          ),
                          child: const Text('Cargar Imágenes'),
                        ),
                        const Text(
                          'Archivos soportados: .jpg, .png',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  _selectedFiles != null
                      ? Text(
                          'Seleccionaste ${_selectedFiles!.length.toString()} imagenes',
                          style: const TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        )

                      // ? Wrap(
                      //     spacing: 8,
                      //     children: _selectedFiles!.map((file) {
                      //       return Column(
                      //         children: [
                      //           Image.memory(file.bytes!,
                      //               width: 100, height: 100),
                      //           Text(file.name),
                      //         ],
                      //       );
                      //     }).toList(),
                      //   )
                      : const Text(''),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(
                  Size(100.0, 30.0),
                ),
              ),
              onPressed: () {
                setState(() {
                  _showProgress = true;
                  _analysisCompleted = false; // Reinicia el estado al iniciar.
                });
              },
              label: const Text('Predecir'),
              icon: const Icon(
                FontAwesomeIcons.wandSparkles,
                size: 10.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // _showProgress
            //     ? Column(
            //         children: [
            //           StreamBuilder(
            //               stream: Stream.periodic(
            //                   const Duration(milliseconds: 300), (value) {
            //                 return (value * 7) / 100;
            //               }).takeWhile((value) => value <= 100),
            //               builder: (context, snapshot) {
            //                 final progressValue = snapshot.data ?? 0;
            //                 return LinearProgressIndicator(
            //                   value: progressValue,
            //                   borderRadius:
            //                       const BorderRadius.all(Radius.circular(10.0)),
            //                 );
            //               }),
            //           const SizedBox(
            //             height: 5.0,
            //           ),
            //           const Text(
            //             'Analizando, por favor espera...',
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 11.0,
            //             ),
            //           ),
            //           SizedBox(
            //             child: Image.asset(
            //               'assets/images/prediccion.png',
            //               // height: 300.0,
            //               // width: 100.0,
            //               scale: 2.5,
            //             ),
            //           )
            //         ],
            //       )
            //     : const Text('')
            _showProgress
                ? Column(
                    children: [
                      StreamBuilder(
                        stream: Stream.periodic(
                          const Duration(milliseconds: 300),
                          (value) => (value * 7) / 100,
                        ).takeWhile((value) => value <= 1),
                        builder: (context, snapshot) {
                          final progressValue = snapshot.data ?? 0.0;

                          // Finaliza el análisis y muestra la imagen.
                          if (progressValue == 0.98 && !_analysisCompleted) {
                            Future.delayed(const Duration(milliseconds: 300),
                                () {
                              setState(() {
                                _showProgress = false;
                                _analysisCompleted = true;
                              });
                            });
                          }

                          return LinearProgressIndicator(
                            value: progressValue,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          );
                        },
                      ),
                      const SizedBox(height: 5.0),
                      !_analysisCompleted
                          ? const Text(
                              'Analizando, por favor espera...',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.0,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  )
                : _analysisCompleted
                    ? Container(
                        height: 230.0,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Resultados',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 330.0,
                                  height: 160.0,
                                  child: Text(
                                    'En el análisis realizado, el modelo predijo la enfermedad del plumero con un 95% de confianza. El error promedio de clasificación (log-loss) fue de 0.15, lo que indica un alto grado de fiabilidad en las predicciones del modelo. Además, el coeficiente F1 alcanzó un valor de 0.92, reflejando un equilibrio adecuado entre precisión y sensibilidad. Estos resultados proporcionan un soporte valioso para la identificación temprana de enfermedades, facilitando la implementación de medidas correctivas oportunas para proteger cultivos y mejorar su rendimiento.',
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: Color(0xFF808080),
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                const SizedBox(
                                  width: 50.0,
                                ),
                                SizedBox(
                                  height: 120.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/prediccion.png',
                                      scale: 2.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    //   child: const Text(
                    //     'En el análisis realizado, el modelo predijo la enfermedad Palomera con un 95% de confianza. El error promedio de clasificación (log-loss) fue de 0.15, lo que indica un alto grado de fiabilidad en las predicciones del modelo. Además, el coeficiente F1 alcanzó un valor de 0.92, reflejando un equilibrio adecuado entre precisión y sensibilidad. Estos resultados proporcionan un soporte valioso para la identificación temprana de enfermedades, facilitando la implementación de medidas correctivas oportunas para proteger cultivos y mejorar su rendimiento.',
                    //     style: TextStyle(
                    //       fontSize: 11.0,
                    //       color: Color(0xFFB98B00),
                    //     ),
                    //   ),
                    // ),

                    : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
