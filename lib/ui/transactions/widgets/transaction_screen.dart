import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:life_flutter/domain/models/transaction.dart';
import 'package:life_flutter/ui/core/app_bar.dart';
import 'package:life_flutter/ui/core/drawer.dart';
import 'package:life_flutter/ui/transactions/viewmodels/transaction_viewmodel.dart';
import 'package:life_flutter/ui/transactions/widgets/transactions.dart';

class DataPoint {
  final double x;
  final double y;

  DataPoint({required this.x, required this.y});

  factory DataPoint.fromJson(Map<String, dynamic> json) {
    return DataPoint(
      // Ensure values are converted to double
      x: json['day'].toDouble(),
      y: json['value'].toDouble(),
    );
  }
}

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key, required this.viewmodel});

  final TransactionViewmodel viewmodel;

  List<FlSpot> getSpots(List<Map<String, dynamic>> jsonList) {
    return jsonList
        .map((item) => DataPoint.fromJson(item))
        .map((point) => FlSpot(point.y, point.x))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> rawJson = [
      {"day": 1, "value": 10},
      {"day": 2, "value": 15},
      {"day": 3, "value": 7},
      {"day": 4, "value": 12},
      {"day": 5, "value": 9},
      {"day": 6, "value": 14},
      {"day": 7, "value": 8},
      {"day": 8, "value": 11},
      {"day": 9, "value": 6},
      {"day": 10, "value": 13},
      {"day": 11, "value": 10},
      {"day": 12, "value": 15},
      {"day": 13, "value": 7},
      {"day": 14, "value": 12},
      {"day": 15, "value": 9},
      {"day": 16, "value": 14},
      {"day": 17, "value": 8},
      {"day": 18, "value": 11},
      {"day": 19, "value": 6},
      {"day": 20, "value": 13},
    ];

    final double chartHeight = rawJson.length * 60.0;
    return Scaffold(
      appBar: const DynamicAppBar(title: 'Transaction'),
      drawer: const DynamicDrawer(
        title: 'Filters',
        items: [
          ListTile(leading: Icon(Icons.settings), title: Text('Filter 1')),
          ListTile(leading: Icon(Icons.sort), title: Text('Sort By')),
        ],
      ),
      endDrawer: const DynamicDrawer(
        title: 'Tools',
        items: [
          ListTile(leading: Icon(Icons.print), title: Text('Export')),
          ListTile(leading: Icon(Icons.arrow_back), title: Text('Import')),
          ListTile(leading: Icon(Icons.edit), title: Text('Bulk Edit')),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InteractiveViewer(
            panEnabled: false,
            minScale: 0.5,
            maxScale: 2.0,
            child: SizedBox(
              width: MediaQuery.widthOf(context),
              height: chartHeight,
              child: LineChart(
                LineChartData(

                  lineTouchData: const LineTouchData(
                    enabled: true, // This enables all interactions
                    handleBuiltInTouches:
                        true, // This handles built-in touch behaviors like pinch to zoom
                  ),
                  titlesData: const FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize:
                            40, // Adjust size to prevent labels from being cut off
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: getSpots(rawJson),
                      // Use the transformed data here
                      isCurved: true,
                      barWidth: 4,
                      color: Colors.blue,
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                  // Optional: Add titles, grid data, and border data here
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
