import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/workout_model.dart';

class WeeklyChart extends StatelessWidget {
  final List<WorkoutModel> workouts;

  const WeeklyChart(this.workouts, {super.key});

  @override
  Widget build(BuildContext context) {
    final spots = <FlSpot>[];

    for (int i = 0; i < workouts.length; i++) {
      spots.add(FlSpot(i.toDouble(), workouts[i].calories.toDouble()));
    }

    return SizedBox(
      height: 200,

      child: LineChart(
        LineChartData(
          titlesData: const FlTitlesData(show: false),

          borderData: FlBorderData(show: false),

          lineBarsData: [LineChartBarData(spots: spots, isCurved: true)],
        ),
      ),
    );
  }
}
