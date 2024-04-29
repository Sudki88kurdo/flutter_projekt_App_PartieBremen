import 'package:flutter/material.dart';

import '../../theme/colors.dart';

///
/// Class which wraps a Safe Area in a Scaffold
/// Thus displaying all its content beneath a notch or other
/// interruptions of a smartphone design

class SafeScaffold extends StatefulWidget {
  /// child that should be shown inside the scaffold
  final Widget child;

  /// drawer of the app that can be added to the scaffold
  final Widget? drawer;

  /// appBar of the app that can be added to the scaffold
  final Widget? appBar;

  /// global key of the scaffold
  final GlobalKey? scaffoldKey;

  /// the color of the unsafe area
  final Color? unsafeColor;

  /// bottom unsafe color (when two different colors are used)
  final Color? bottomUnsafeColor;

  /// flag that indicates if the top unsafe color should be different from the
  /// bottom one
  final bool? hasDifferentUnsafeColors;

  /// If the Scaffold should make space for
  /// any keyboard on the bottom of the screen
  final bool? resizeToAvoidBottomInset;

  /// Floating Action Button shown at the bottom of this scaffold
  final Widget? floatingActionButton;

  /// Bottom Navigation Bar shown at the bottom of this scaffold
  final Widget? bottomNavigationBar;

  /// Be Safe Top
  final bool top;

  /// Be Safe Left
  final bool left;

  /// Be Safe Right
  final bool right;

  /// Be Safe Bottom
  final bool bottom;

  /// constructor that sets all the parameter
  const SafeScaffold({
    super.key,
    required this.child,
    this.scaffoldKey,
    this.drawer,
    this.appBar,
    this.unsafeColor,
    this.bottomUnsafeColor,
    this.hasDifferentUnsafeColors = false,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.top = true,
    this.left = true,
    this.right = true,
    this.bottom = true,
  });

  @override
  State<StatefulWidget> createState() => SafeScaffoldState();
}

class SafeScaffoldState extends State<SafeScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      drawerEnableOpenDragGesture: false,
      key: widget.scaffoldKey,
      bottomNavigationBar: widget.bottomNavigationBar,
      appBar: widget.appBar as PreferredSizeWidget?,
      drawer: widget.drawer,
      floatingActionButton: widget.floatingActionButton,
      body: Container(
        decoration: _decoration,
        child: SafeArea(
          top: widget.top,
          bottom: widget.bottom,
          left: widget.left,
          right: widget.right,
          child: widget.child,
        ),
      ),
    );
  }

  /// returns the decoration of the hints, uses either only the unsafe color
  /// or uses the unsafe color and the bottom unsafe color as gradient to show
  /// different unsafe colors in the screen
  BoxDecoration get _decoration {
    // uses just the normal unsafe color as background decoration
    if (!widget.hasDifferentUnsafeColors!) {
      return BoxDecoration(
        color: widget.unsafeColor ?? black,
      );
    }

    // returns a gradient with the two different unsafe colors, is used to show
    // the normal unsafe color on the top of the scaffold and the bottom unsafe
    // color at the bottom of the unsafe zone
    return BoxDecoration(
      gradient: SweepGradient(
        center: FractionalOffset.center,
        endAngle: 6.28,
        stops: const <double>[0.0, 0.5, 0.5, 1.0],
        colors: <Color>[
          widget.bottomUnsafeColor ?? black,
          widget.bottomUnsafeColor ?? black,
          widget.unsafeColor ?? black,
          widget.unsafeColor ?? black,
        ],
      ),
    );
  }
}
