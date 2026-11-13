import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  // Initialize destination model data tailored for Sibu Rajang River Cruise
  final CruiseDestination destination = CruiseDestination(
    name: 'Rajang River Express Cruise',
    subtitle: 'Sibu Waterfront, Sarawak',
    location: 'Sibu Esplanade Landmark',
    description: 'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and waterfront settlements.',
    imageUrl: 'https://images.unsplash.com/photo-1544644181-1484b3fdfc62',
    rating: 43,
  );

  // State variables for interactive controls & theme
  DateTime _selectedDate = DateTime.now();
  String _selectedPackage = 'Express Boat';
  bool _isDarkMode = false;

  // Getters to access private state safely
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  // Available cruise packages list as specified in the lab guide
  final List<String> availablePackages = [
    'Express Boat',
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // Business logic methods to update state and notify UI listeners
  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void updatePackage(String? newPackage) {
    if (newPackage != null) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void incrementRating() {
    destination.rating += 1;
    notifyListeners();
  }
}