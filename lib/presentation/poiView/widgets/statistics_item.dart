import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticsItem extends StatelessWidget {
  final String? title;
  final String? value;
  final IconData? icon;

  const StatisticsItem({
    super.key,
    this.title,
    this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon
        Icon(icon ?? Icons.abc, color: Colors.black54, size: 25),

        // Padding
        const SizedBox(height: 5),

        // Value and Title
        Text(
          title ?? "Konnte nicht geladen werden",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.black54),
        ),
        Text(
          value ?? "0",
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}