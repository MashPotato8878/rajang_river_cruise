import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingControlsWidget extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedPackage;
  final List<String> availablePackages;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<String?> onPackageChanged;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggled;

  const BookingControlsWidget({
    super.key,
    required this.selectedDate,
    required this.selectedPackage,
    required this.availablePackages,
    required this.onDateChanged,
    required this.onPackageChanged,
    required this.isDarkMode,
    required this.onThemeToggled,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trip Preferences',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 24),
              // Visit Date Picker Tile
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Cruise Date'),
                subtitle: Text(formattedDate),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    onDateChanged(picked);
                  }
                },
              ),
              const Divider(),
              // Cruise Package Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Transport Mode', style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    value: selectedPackage,
                    items: availablePackages.map((String package) {
                      return DropdownMenuItem<String>(
                        value: package,
                        child: Text(package),
                      );
                    }).toList(),
                    onChanged: onPackageChanged,
                  ),
                ],
              ),
              const Divider(),
              // Dark Mode Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Dark Mode Theme', style: TextStyle(fontSize: 16)),
                  Switch(
                    value: isDarkMode,
                    onChanged: onThemeToggled,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}