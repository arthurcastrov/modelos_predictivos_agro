import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modelos_predictivos_agro/components/line_chart_graphic.dart';

class EmbededPrediccionPrecioArroz extends StatefulWidget {
  const EmbededPrediccionPrecioArroz({super.key});

  @override
  State<EmbededPrediccionPrecioArroz> createState() =>
      _EmbededPrediccionPrecioArrozState();
}

class _EmbededPrediccionPrecioArrozState
    extends State<EmbededPrediccionPrecioArroz> {
  String _selectedValue = 'ArrozGranoCorto';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        width: MediaQuery.sizeOf(context).width * 0.65,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.10,
              ),
              const Text(
                'Predicción precio del arroz',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Selecciona un tipo de arroz para ver el comportamiento historico y un precio pronosticado',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.18,
                      height: 250.0,
                      child: ListView(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        // physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          RadioListTile(
                              title: const Text('Arroz de grano corto'),
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
                              value: 'ArrozGranoCorto',
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value!;
                                });
                              }),
                          RadioListTile(
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            title: const Text('Arroz de grano medio'),
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
                            value: 'ArrozGranoMedio',
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                              print(_selectedValue);
                            },
                          ),
                          RadioListTile(
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            title: const Text('Arroz de grano largo'),
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
                          RadioListTile(
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            title: const Text('Arroz de vaporizado'),
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
                            value: 4,
                            groupValue: _selectedValue,
                            onChanged: null,
                          ),
                          RadioListTile(
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            title: const Text('Arroz precocido'),
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
                            value: 5,
                            groupValue: _selectedValue,
                            onChanged: null,
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   width: 20.0,
                    // ),
                    SizedBox(
                        // height: 380.0,
                        height: MediaQuery.sizeOf(context).height * 0.50,
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        child: LineChartGraphic(
                          filtroTipoArroz: _selectedValue,
                        )),
                    // const SizedBox(
                    //   height: 100.0,
                    // ),
                  ]),
              Container(
                height: 125.0,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 30.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: const SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resultados',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        // width: MediaQuery.sizeOf(context).width * 0.65,
                        width: double.infinity,
                        height: 65.0,
                        child: Text(
                          'El modelo logró un porcentaje de exactitud del 92%, lo que indica una alta correspondencia entre los valores reales y los valores predichos. El error medio absoluto (MAE) del modelo es de 1.5 pesos, lo que refleja la desviación promedio entre los precios reales y los predichos en la misma escala monetaria. Además, el error cuadrático medio (RMSE) se estimó en 0.5 pesos, lo que muestra la magnitud del error considerando las desviaciones más significativas. El coeficiente de determinación (R²) fue de 0.89, lo que sugiere que el modelo explica un 89% de la variabilidad en los precios observados.',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Color(0xFF808080),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
