import 'package:flutter/material.dart';

class BookingControlsWidget extends StatelessWidget {
  final String formattedDate;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final String selectedPackage;
  final List<String> availablePackages;
  final ValueChanged<String?> onPackageChanged;
  final bool isDarkMode;
  final ValueChanged<bool> onDarkModeChanged;

  const BookingControlsWidget({
    super.key,
    required this.formattedDate,
    required this.selectedDate,
    required this.onDateChanged,
    required this.selectedPackage,
    required this.availablePackages,
    required this.onPackageChanged,
    required this.isDarkMode,
    required this.onDarkModeChanged,
  });

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trip Preferences',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Visit Date Picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Visit Date:', style: TextStyle(fontSize: 14)),
                  InkWell(
                    onTap: () => _pickDate(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            formattedDate,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Cruise Package Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Cruise Package:', style: TextStyle(fontSize: 14)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: colorScheme.outline),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedPackage,
                        items: availablePackages.map((pkg) {
                          return DropdownMenuItem<String>(
                            value: pkg,
                            child: Text(pkg, style: const TextStyle(fontSize: 14)),
                          );
                        }).toList(),
                        onChanged: onPackageChanged,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),

              // Dark Mode Theme Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.dark_mode_outlined, size: 20),
                      SizedBox(width: 8),
                      Text('Dark Mode Theme', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Switch(
                    value: isDarkMode,
                    onChanged: onDarkModeChanged,
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