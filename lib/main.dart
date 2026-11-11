
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import HomeScreen
import 'screens/hone_screen.dart';

// Import HabitProvider
import 'screens/habbit_provider.dart';

// Import ThemeProvider
import 'utils/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Register HabitProvider
        ChangeNotifierProvider(
          create: (context) => HabitProvider(),
        ),

        // Register ThemeProvider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],

      // Start the app
      child: const DhikrEaseApp(),
    ),
  );
}

class DhikrEaseApp extends StatelessWidget {
  const DhikrEaseApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Get current theme mode
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DhikrEase',

      // Light Theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),

      // Dark Theme
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // Select Light or Dark Theme
      themeMode: themeProvider.themeMode,

      // Open HomeScreen
      home: const HomeScreen(),
    );
  }
}
