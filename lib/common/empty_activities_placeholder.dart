import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class EmptyActivitiesPlaceholder extends StatelessWidget {
  /// Text to display
  final String? text;

  const EmptyActivitiesPlaceholder({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Acitivity Image
        const SizedBox(
          height: 120,
          width: 250,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(top: 0, child: _ActivityMessageContainer()),
              Positioned(
                top: 40,
                right: 0,
                child: _ActivityMessageContainer(),
              ),
            ],
          ),
        ),

        // Text
        Text(
          text ?? "HUB_SCREEN.NO_ACTIVITY".tr(),
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ActivityMessageContainer extends StatelessWidget {
  const _ActivityMessageContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Row(
        children: [
          CircleAvatar(radius: 20, backgroundColor: Colors.grey),

          // Padding
          SizedBox(width: 10),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CircularContainer(),
                _CircularContainer(width: 90),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CircularContainer extends StatelessWidget {
  final double? width;

  const _CircularContainer({this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.withOpacity(0.4),
      ),
    );
  }
}
