import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Instantiate the ViewModel at the root level
  final CruiseBookingViewModel _viewModel = CruiseBookingViewModel();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, child) {
        return MaterialApp(
          title: 'Sibu Rajang River Cruise',
          debugShowCheckedModeBanner: false,
          // Dynamic theme switching based on ViewModel state
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: CruiseBookingScreen(viewModel: _viewModel),
        );
      },
    );
  }
}