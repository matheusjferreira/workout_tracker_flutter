import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/workout_model.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<WorkoutModel>('workouts');

    final workouts = box.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Histórico")),

      body: ListView.builder(
        itemCount: workouts.length,

        itemBuilder: (context, index) {
          final w = workouts[index];

          return ListTile(
            title: Text(w.name),

            subtitle: Text("${w.duration} min • ${w.calories} kcal"),

            trailing: Text("${w.date.day}/${w.date.month}"),
          );
        },
      ),
    );
  }
}
