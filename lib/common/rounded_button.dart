import 'package:flutter/material.dart';

import '../theme/colors.dart';

class RoundedButton extends StatelessWidget {
  final Color? foregroundColor;
  final Color? backgroundColor;
  final String? text;
  final VoidCallback? onPressed;
  final Size? size;
  final double? elevation;
  final BorderSide? borderSide;
  final bool loading;
  final Color loadingColor;
  final bool disabled;
  final Color disabledBackgroundColor;
  final Color disabledForegroundColor;
  final double? borderRadius;

  const RoundedButton({
    super.key,
    this.foregroundColor,
    this.backgroundColor,
    this.text,
    this.onPressed,
    this.size,
    this.elevation = 5,
    this.borderSide,
    this.loading = false,
    this.loadingColor = white,
    this.disabled = false,
    this.disabledBackgroundColor = lightGrey,
    this.disabledForegroundColor = grey,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: size ?? const Size(double.infinity, 48),
        minimumSize: size ?? const Size(double.infinity, 48),
        maximumSize: size ?? const Size(double.infinity, 48),
        foregroundColor:
            disabled ? disabledForegroundColor : foregroundColor ?? white,
        backgroundColor:
            disabled ? disabledBackgroundColor : backgroundColor ?? darkGrey,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          // Black Border Side
          side: borderSide ?? BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
      ),
      onPressed: (disabled || loading) ? null : () => onPressed?.call(),
      child: loading
          ? Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: loadingColor,
                  strokeWidth: 2,
                ),
              ),
            )
          : Text(
              text ?? "",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: foregroundColor,
                    height: 0,
                  ),
            ),
    );
  }
}
