import 'package:dotted_line/dotted_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartGraphic extends StatefulWidget {
  const LineChartGraphic({
    super.key,
    Color? tooltipTextColor,
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
  final Map<String, double> priceData = {
    'Ene-24': 45.0, // Históricos
    'Feb-24': 46.2,
    'Mar-24': 47.5,
    'Abr-24': 48.0,
    'May-24': 47.8,
    'Jun-24': 48.3,
    'Jul-24': 49.0,
    'Ago-24': 49.5, // Proyección
    'Sep-24': 50.0,
    'Oct-24': 50.5,
    'Nov-24': 51.0,
    'Dic-24': 51.5,
    'Ene-25': 48.0,
    'Feb-25': 52.5,
    'Mar-25': 50.5,
    'Abr-25': 51.0,
    'May-25': 51.5,
    'Jun-25': 52.0,
    'Jul-25': 52.5,
  };
  late double touchedValue;
  bool fitInsideBottomTitle = true;
  bool fitInsideLeftTitle = false;

  @override
  Widget build(BuildContext context) {
    final historicalData =
        priceData.entries.where((entry) => !entry.key.endsWith('-25')).toList();
    final forecastData =
        priceData.entries.where((entry) => entry.key.endsWith('-25')).toList();
    final rellenoData = priceData.entries
        .where((entry) =>
            entry.key.startsWith('Dic-24') || entry.key.startsWith('Ene-25'))
        .toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 10.0,
        ),
        // const Align(
        //   alignment: Alignment.center,
        //   child: Text(
        //     'Por mes',
        //     style: TextStyle(
        //       color: Color(0xFF5E4EF3),
        //       // color: Colors.cyan,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
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
                lineBarsData: [
                  LineChartBarData(
                    dotData: FlDotData(
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 3.0, // Ajusta el radio para cambiar el tamaño
                          color:
                              Theme.of(context).primaryColor, // Color del punto
                          strokeWidth: 0, // Borde opcional
                          strokeColor: Colors.transparent,
                        );
                      },
                    ),
                    color: Theme.of(context).primaryColor,
                    spots: historicalData
                        .map((entry) => FlSpot(
                              priceData.keys
                                  .toList()
                                  .indexOf(entry.key)
                                  .toDouble(),
                              entry.value,
                            ))
                        .toList(),
                    isCurved: false,
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
                  LineChartBarData(
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 3.0, // Ajusta el radio para cambiar el tamaño
                          // color: Colors.grey, // Color del punto
                          color: const Color(0xFFFFBF00),
                          strokeWidth: 0, // Borde opcional
                          strokeColor: Colors.transparent,
                        );
                      },
                    ),
                    // color: Colors.grey,
                    color: const Color(0xFFFFBF00),
                    spots: forecastData
                        .map((entry) => FlSpot(
                              priceData.keys
                                  .toList()
                                  .indexOf(entry.key)
                                  .toDouble(),
                              entry.value,
                            ))
                        .toList(),
                    isCurved: false,
                    barWidth: 2,
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
                        if (index >= 0 && index < priceData.keys.length) {
                          return Text(
                            priceData.keys.toList()[index],
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
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (touchedSpot) => Colors.black,
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return touchedBarSpots.map((barSpot) {
                        final flSpot = barSpot;
                        return LineTooltipItem(
                            'Total ', const TextStyle(color: Colors.white),
                            children: [TextSpan(text: flSpot.y.toString())]);
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
