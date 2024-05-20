import 'package:flutter/material.dart';

///
/// button that reduces the opacity when the button is tapped, behaves mainly
/// like the touchable opacity in react native
///
class TouchableOpacity extends StatefulWidget {
  /// the opacity that should be used when the button is pressed
  final double? opacity;

  /// the child that should be displayed within the child
  final Widget? child;

  /// on tap callback that is called when the button is tapped
  final GestureTapCallback? onTap;

  /// on long press callback that is called when the button is long pressed
  final Function(LongPressStartDetails)? onLongPress;

  /// constructor of the button
  const TouchableOpacity({
    super.key,
    this.child,
    this.onTap,
    this.opacity,
    this.onLongPress,
  });

  @override
  State createState() => _TouchableOpacityState();
}

/// state of the component
class _TouchableOpacityState extends State<TouchableOpacity> {
  /// flag that indicates if the button is touched or not
  bool touched = false;

  /// opacity of the button
  late double opacity;

  @override
  void initState() {
    /// sets the based on the value that is passed
    opacity = widget.opacity != null ? widget.opacity! : 0.4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(),
      onTapDown: (_) => _onTap(),
      onTapUp: (d) => _onRelease(),
      onTapCancel: _onRelease,
      onLongPressDown: (_) => _onTap(),
      onLongPressUp: () => _onRelease(),
      onLongPressCancel: _onRelease,
      // onLongPress: () => widget.onLongPress?.call(),
      onLongPressStart: (d) => widget.onLongPress?.call(d),
      child: Opacity(
        opacity: touched ? opacity : 1,
        child: widget.child,
      ),
    );
  }

  /// is called when the button is tapped, changes the opacity of the button by
  /// setting the touched flag
  void _onTap() => setState(() => touched = true);

  /// is called when the button is released, changes the opacity of the button
  /// by resetting the touched flag
  void _onRelease() => setState(() => touched = false);
}
