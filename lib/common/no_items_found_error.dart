import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/rounded_button.dart';

import '../theme/colors.dart';
import 'empty_activities_placeholder.dart';

class NoItemsFoundError extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;

  const NoItemsFoundError({super.key, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Empty Activities Placeholder
          EmptyActivitiesPlaceholder(text: text),

          // Padding
          const SizedBox(height: 16),

          // If onPressed is not null, show the button
          if (onPressed != null)
            RoundedButton(
              text: "HUB_SCREEN.SUBMIT_YOUR_CREATION".tr(),
              foregroundColor: white,
              backgroundColor: lightPurple,
              onPressed: () => onPressed?.call(),
            ),
        ],
      ),
    );
  }
}
