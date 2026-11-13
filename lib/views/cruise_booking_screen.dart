import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sibu River Cruise & Heritage'),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.landscape) {
                // Landscape Mode: Side-by-Side Split Pane using Row & Expanded
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: HeaderImageWidget(
                        imageUrl: viewModel.destination.imageUrl,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleSectionWidget(
                              destination: viewModel.destination,
                              onRatingPressed: viewModel.incrementRating,
                            ),
                            const ActionBarWidget(),
                            const Divider(),
                            DescriptionWidget(
                              description: viewModel.destination.description,
                            ),
                            BookingControlsWidget(
                              selectedDate: viewModel.selectedDate,
                              selectedPackage: viewModel.selectedPackage,
                              availablePackages: viewModel.availablePackages,
                              onDateChanged: viewModel.updateDate,
                              onPackageChanged: viewModel.updatePackage,
                              isDarkMode: viewModel.isDarkMode,
                              onThemeToggled: viewModel.toggleTheme,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                // Portrait Mode: Single-Column Scrollable ListView
                return ListView(
                  children: [
                    HeaderImageWidget(
                      imageUrl: viewModel.destination.imageUrl,
                    ),
                    TitleSectionWidget(
                      destination: viewModel.destination,
                      onRatingPressed: viewModel.incrementRating,
                    ),
                    const ActionBarWidget(),
                    const Divider(),
                    DescriptionWidget(
                      description: viewModel.destination.description,
                    ),
                    BookingControlsWidget(
                      selectedDate: viewModel.selectedDate,
                      selectedPackage: viewModel.selectedPackage,
                      availablePackages: viewModel.availablePackages,
                      onDateChanged: viewModel.updateDate,
                      onPackageChanged: viewModel.updatePackage,
                      isDarkMode: viewModel.isDarkMode,
                      onThemeToggled: viewModel.toggleTheme,
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}