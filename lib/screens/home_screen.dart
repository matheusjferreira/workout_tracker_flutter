import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/workout_model.dart';
import '../widgets/add_workout_dialog.dart';
import '../widgets/goal_widget.dart';
import '../widgets/stats_grid.dart';
import '../widgets/weekly_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<WorkoutModel>('workouts');

    return Scaffold(
      appBar: AppBar(title: const Text("Workout Tracker")),

      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<WorkoutModel> box, _) {
          final workouts = box.values.toList();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              GoalWidget(workouts),

              const SizedBox(height: 20),

              StatsGrid(workouts),

              const SizedBox(height: 20),

              const Text(
                "Evolução",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              WeeklyChart(workouts),

              const SizedBox(height: 20),

              /// TREINOS RECENTES
              const Text(
                "Treinos recentes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              ...workouts.reversed.take(5).map((w) {
                return Card(
                  child: ListTile(
                    title: Text(w.name),
                    subtitle: Text("${w.duration} min • ${w.calories} kcal"),
                  ),
                );
              }),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const AddWorkoutDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
