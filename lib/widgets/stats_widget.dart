import 'package:flutter/material.dart';
import '../models/workout_model.dart';

class StatsWidget extends StatelessWidget {
  final List<WorkoutModel> workouts;

  const StatsWidget(this.workouts, {super.key});

  @override
  Widget build(BuildContext context) {
    final totalCalories = workouts.fold(0, (sum, w) => sum + w.calories);

    final totalDuration = workouts.fold(0, (sum, w) => sum + w.duration);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const Text("Estatísticas", style: TextStyle(fontSize: 18)),

            const SizedBox(height: 10),

            Text("Treinos: ${workouts.length}"),
            Text("Tempo: $totalDuration min"),
            Text("Calorias: $totalCalories kcal"),
          ],
        ),
      ),
    );
  }
}
