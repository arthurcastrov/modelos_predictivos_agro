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
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        title: const Text('Arroz de grano medio'),
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
                    height: 400.0,
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    child: const LineChartGraphic()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
