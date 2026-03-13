import 'package:flutter/material.dart';
import '../models/workout_model.dart';

class GoalWidget extends StatelessWidget {
  final List<WorkoutModel> workouts;

  const GoalWidget(this.workouts, {super.key});

  @override
  Widget build(BuildContext context) {
    const int goalCalories = 500;

    final today = DateTime.now();

    final todayCalories = workouts
        .where(
          (w) =>
              w.date.day == today.day &&
              w.date.month == today.month &&
              w.date.year == today.year,
        )
        .fold<int>(0, (sum, w) => sum + w.calories);

    final progress = (todayCalories / goalCalories).clamp(0.0, 1.0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Meta diária",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text("$todayCalories / $goalCalories kcal"),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.amber,
            ),

            const SizedBox(height: 8),

            if (todayCalories >= goalCalories)
              const Text(
                "Meta atingida! 🔥",
                style: TextStyle(color: Colors.green),
              )
            else
              Text("Faltam ${goalCalories - todayCalories} kcal"),
          ],
        ),
      ),
    );
  }
}
