import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final destination = viewModel.destination;

        return OrientationBuilder(
          builder: (context, orientation) {
            final isLandscape = orientation == Orientation.landscape;

            return Scaffold(
              appBar: AppBar(
                title: Text(
                  isLandscape
                      ? 'Sibu River Cruise & Heritage (Landscape Split View)'
                      : 'Sibu River Cruise & Heritage',
                  style: const TextStyle(fontSize: 17),
                ),
                actions: [
                  if (isLandscape)
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Chip(
                        label: Text(
                          orientation.toString(),
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),
                    ),
                ],
              ),
              body: isLandscape
                  ? _buildLandscapeLayout(context, destination)
                  : _buildPortraitLayout(context, destination),
            );
          },
        );
      },
    );
  }

  Widget _buildPortraitLayout(BuildContext context, dynamic destination) {
    return ListView(
      children: [
        HeaderImageWidget(
          imageUrl: destination.imageUrl,
          badgeText: destination.portraitBannerText,
        ),
        TitleSectionWidget(
          title: destination.title,
          location: destination.location,
          starCount: viewModel.starCount,
          isStarred: viewModel.isStarred,
          onStarTap: viewModel.toggleStar,
        ),
        ActionBarWidget(
          onActionTap: (msg) => _showSnackBar(context, msg),
        ),
        DescriptionWidget(description: destination.description),
        BookingControlsWidget(
          formattedDate: viewModel.formattedDate,
          selectedDate: viewModel.selectedDate,
          onDateChanged: viewModel.updateDate,
          selectedPackage: viewModel.selectedPackage,
          availablePackages: destination.packages,
          onPackageChanged: viewModel.updatePackage,
          isDarkMode: viewModel.isDarkMode,
          onDarkModeChanged: viewModel.toggleDarkMode,
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context, dynamic destination) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderImageWidget(
                  imageUrl: destination.imageUrl,
                  badgeText: destination.landscapeBannerText,
                  height: 200,
                ),
                DescriptionWidget(
                  description: destination.description,
                  showHeading: true,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: ListView(
            children: [
              TitleSectionWidget(
                title: destination.title,
                location: destination.location,
                starCount: viewModel.starCount,
                isStarred: viewModel.isStarred,
                onStarTap: viewModel.toggleStar,
              ),
              ActionBarWidget(
                onActionTap: (msg) => _showSnackBar(context, msg),
              ),
              const SizedBox(height: 8),
              BookingControlsWidget(
                formattedDate: viewModel.formattedDate,
                selectedDate: viewModel.selectedDate,
                onDateChanged: viewModel.updateDate,
                selectedPackage: viewModel.selectedPackage,
                availablePackages: destination.packages,
                onPackageChanged: viewModel.updatePackage,
                isDarkMode: viewModel.isDarkMode,
                onDarkModeChanged: viewModel.toggleDarkMode,
              ),
            ],
          ),
        ),
      ],
    );
  }
}