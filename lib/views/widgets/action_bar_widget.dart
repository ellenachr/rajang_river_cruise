import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  final void Function(String action) onActionTap;

  const ActionBarWidget({
    super.key,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(
                icon: Icons.call,
                label: 'CALL',
                color: color,
                onTap: () => onActionTap('Calling Sibu River Cruise Terminal...'),
              ),
              _buildButton(
                icon: Icons.near_me,
                label: 'ROUTE',
                color: color,
                onTap: () => onActionTap('Opening route to Sibu Waterfront...'),
              ),
              _buildButton(
                icon: Icons.share,
                label: 'SHARE',
                color: color,
                onTap: () => onActionTap('Sharing Rajang River Cruise details...'),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}