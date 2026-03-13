import 'package:flutter/material.dart';

import '../models/workout_model.dart';

class StatsGrid extends StatelessWidget {
  final List<WorkoutModel> workouts;

  const StatsGrid(this.workouts, {super.key});

  @override
  Widget build(BuildContext context) {
    final totalCalories = workouts.fold(0, (sum, w) => sum + w.calories);

    final totalDuration = workouts.fold(0, (sum, w) => sum + w.duration);

    final avgCalories = workouts.isEmpty ? 0 : totalCalories ~/ workouts.length;

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.6,

      children: [
        _StatCard("Treinos", "${workouts.length}", Icons.fitness_center),

        _StatCard("Tempo", "$totalDuration min", Icons.timer),

        _StatCard("Calorias", "$totalCalories", Icons.local_fire_department),

        _StatCard("Média", "$avgCalories kcal", Icons.show_chart),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard(this.title, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          children: [
            Icon(icon, size: 30),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(color: Colors.black)),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
