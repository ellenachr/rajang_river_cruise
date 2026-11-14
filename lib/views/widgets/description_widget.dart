import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  final bool showHeading;

  const DescriptionWidget({
    super.key,
    required this.description,
    this.showHeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeading) ...[
            const Text(
              'About the Destination',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
          ],
          Text(
            description,
            style: const TextStyle(fontSize: 14, height: 1.5),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}