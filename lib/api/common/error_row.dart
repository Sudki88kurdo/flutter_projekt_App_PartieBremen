import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../theme/colors.dart';

class ErrorRow extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;
  final EdgeInsets? padding;

  const ErrorRow({
    super.key,
    required this.title,
    required this.description,
    required this.child,
    this.padding,
  });

  // TODO: Translations
  ErrorRow.empty({Key? key, String? description})
      : this(
          key: key,
          title: "Oops! Nothing Here",
          description: description ??
              "It seems no one has submitted anything yet. Be the first to contribute to the community by creating a pin or map to this game!",
          child: Assets.images.icons.empty.image(width: 48),
        );

  ErrorRow.error({Key? key})
      : this(
          key: key,
          title: "Oops! Something went wrong",
          description:
              "We couldn't load the Data you were looking for. Please Check Your Internet Connection or Try Again Later",
          child: Assets.images.icons.noConnection.image(width: 48),
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Error Icon
          CircleAvatar(
            backgroundColor: white.withOpacity(0.02),
            radius: 48,
            child: child,
          ),

          // Error Text
          const SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                // Padding
                const SizedBox(height: 4),

                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
