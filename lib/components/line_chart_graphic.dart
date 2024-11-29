import 'package:dotted_line/dotted_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:modelos_predictivos_agro/components/precios_arroz.dart';

class LineChartGraphic extends StatefulWidget {
  final String filtroTipoArroz;
  const LineChartGraphic({
    super.key,
    Color? tooltipTextColor,
    required this.filtroTipoArroz,
    // Color? indicatorTouchedLineColor,
    // Color? indicatorTouchedSpotStrokeColor,
  }) : tooltipTextColor = tooltipTextColor ?? Colors.white;
  // indicatorTouchedLineColor = indicatorTouchedLineColor ?? Colors.amber,
  // indicatorTouchedSpotStrokeColor =
  //     indicatorTouchedSpotStrokeColor ?? Colors.amber;

  final Color tooltipTextColor;
  // final Color indicatorTouchedLineColor;
  // final Color indicatorTouchedSpotStrokeColor;
  @override
  State<LineChartGraphic> createState() => _LineChartGraphicState();
}

class _LineChartGraphicState extends State<LineChartGraphic> {
  late double touchedValue;
  bool fitInsideBottomTitle = true;
  bool fitInsideLeftTitle = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, double> forecastData =
        preciosTipoArroz[widget.filtroTipoArroz]!['forecast']!;
    final Map<String, double> historicalData = Map.fromEntries(
        preciosTipoArroz[widget.filtroTipoArroz]!['historical']!
            .entries
            .where((entry) => !entry.key.endsWith('-25'))
            .toList());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: 200.0,
          height: 20.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Historico ',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              ),
              DottedLine(
                direction: Axis.horizontal,
                lineLength: 20.0,
                dashColor: Theme.of(context).primaryColor,
                dashGapLength: 0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text(
                'Pronostico ',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              ),
              const DottedLine(
                direction: Axis.horizontal,
                lineLength: 20.0,
                dashColor: Color(0xFFFFBF00),
                lineThickness: 2.0,
                dashGapLength: 3.0,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        AspectRatio(
          aspectRatio: 2.2,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 5.0,
              left: 10.0,
              top: 5.0,
              bottom: 5.0,
            ),
            child: LineChart(
              LineChartData(
                // Dibujar línea de pronostico, se dibuja debajo por eso esta de preimeras
                lineBarsData: [
                  LineChartBarData(
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 3.0, // Ajusta el radio para cambiar el tamaño
                          // color: Colors.grey, // Color del punto
                          color: const Color(0xFFFFBF00),
                          strokeWidth: 1.5, // Borde opcional
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    // color: Colors.grey,
                    color: const Color(0xFFFFBF00),
                    spots: forecastData.entries
                        .map((entry) => FlSpot(
                              forecastData.keys
                                  .toList()
                                  .indexOf(entry.key)
                                  .toDouble(),
                              entry.value,
                            ))
                        .toList(),
                    isCurved: true,
                    barWidth: 1,
                    dashArray: [6, 3],
                    // colors: [Colors.blue],
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          // Colors.grey.withOpacity(0.7),
                          const Color(0xFFFFBF00).withOpacity(0.7),
                          Colors.white.withOpacity(0.2)
                        ],
                      ),
                      // color: Theme.of(context).primaryColor.withOpacity(0.20),
                    ),
                  ),
                  LineChartBarData(
                    dotData: FlDotData(
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 3.0, // Ajusta el radio para cambiar el tamaño
                          color:
                              Theme.of(context).primaryColor, // Color del punto
                          strokeWidth: 1.5, // Borde opcional
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    color: Theme.of(context).primaryColor,
                    spots: historicalData.entries
                        .map((entry) => FlSpot(
                              historicalData.keys
                                  .toList()
                                  .indexOf(entry.key)
                                  .toDouble(),
                              entry.value,
                            ))
                        .toList(),
                    isCurved: true,
                    barWidth: 1,
                    isStrokeCapRound: true,
                    // dashArray: [5, 5],
                    // colors: [Colors.blue],
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.7),
                          Colors.white.withOpacity(0.2)
                        ],
                      ),
                      // color: Theme.of(context).primaryColor.withOpacity(0.20),
                    ),
                  ),
                ],

                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 40.0,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 &&
                            index <
                                // dataTipoArrozFiltrada['ArrozGranoCorto']!
                                forecastData.length) {
                          return Text(
                            // dataTipoArrozFiltrada['ArrozGranoCorto']!
                            forecastData.keys.toList()[index],
                            style: const TextStyle(
                                fontSize: 10.0, color: Colors.grey),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40.0,
                      getTitlesWidget: (value, meta) => Text(
                        value.toStringAsFixed(1),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                lineTouchData: LineTouchData(
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> spotIndexes) {
                    return spotIndexes.map((index) {
                      return TouchedSpotIndicatorData(
                        FlLine(color: barData.color),
                        FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 6,
                            color: barData.color!,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          ),
                        ),
                      );
                    }).toList();
                  },
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (touchedSpot) => Colors.black,
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return touchedBarSpots.map((barSpot) {
                        final flSpot = barSpot;
                        return LineTooltipItem(
                            'Valor total: ',
                            TextStyle(
                                color: barSpot.bar.color,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: flSpot.y.toString(),
                                  style: TextStyle(
                                      color: barSpot.bar.color,
                                      fontWeight: FontWeight.bold))
                            ]);
                      }).toList();
                    },
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  getDrawingVerticalLine: (value) {
                    return const FlLine(
                      color: Color(0xFFE7E7E7),
                      strokeWidth: 1.0,
                    );
                  },
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Color(0xFFE7E7E7),
                      strokeWidth: 1.0,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
