import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/workout_model.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(WorkoutModelAdapter());

  await Hive.openBox<WorkoutModel>('workouts');

  runApp(const WorkoutApp());
}

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Workout Tracker",
      theme: ThemeData(
        useMaterial3: true,

        brightness: Brightness.light,

        scaffoldBackgroundColor: const Color(0xFFF1EFE9),

        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6AAAE6),
          secondary: Color(0xFF2EC4B6),
          surface: Color(0xFFFFFBF5),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6AAAE6),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),

        cardTheme: CardThemeData(
          color: const Color(0xFFFFFBF5),
          elevation: 8,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF6AAAE6),
          foregroundColor: Colors.white,
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2B2B2B),
          ),
          bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF4A4A4A)),
        ),

        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFF6AAAE6),
          linearTrackColor: Color(0xFFE6E1D8),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
