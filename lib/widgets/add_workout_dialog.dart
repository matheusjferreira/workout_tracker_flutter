import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/workout_model.dart';

class AddWorkoutDialog extends StatefulWidget {
  const AddWorkoutDialog({super.key});

  @override
  State<AddWorkoutDialog> createState() => _AddWorkoutDialogState();
}

class _AddWorkoutDialogState extends State<AddWorkoutDialog> {
  final nameController = TextEditingController();
  final durationController = TextEditingController();

  String selectedExercise = "Flexão";

  final caloriesMap = {"Flexão": 8, "Corrida": 10, "Abdominal": 6, "Bike": 7};

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<WorkoutModel>('workouts');

    return AlertDialog(
      title: const Text("Novo treino"),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField(
            initialValue: selectedExercise,
            items: caloriesMap.keys.map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedExercise = value!;
              });
            },
          ),

          TextField(
            controller: durationController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Duração (min)"),
          ),
        ],
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancelar"),
        ),

        ElevatedButton(
          onPressed: () {
            final duration = int.parse(durationController.text);

            final calories = duration * caloriesMap[selectedExercise]!;

            final workout = WorkoutModel(
              name: selectedExercise,
              duration: duration,
              calories: calories,
              date: DateTime.now(),
            );

            box.add(workout);

            Navigator.pop(context);
          },
          child: const Text("Salvar"),
        ),
      ],
    );
  }
}
