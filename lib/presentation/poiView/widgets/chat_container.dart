import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/login-page/login_page_provider.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/rounded_button.dart';
import '../../../common/screen_status.dart';
import '../../../theme/colors.dart';
import '../../app/app_cubit.dart';
import '../../app/app_state.dart';

class ChatContainer extends StatelessWidget {
  /// Current Opacity Value
  final double value;

  /// Min Value at which the Container should not be visible anymore (not interactive)
  final double minOpacityValue;

  /// Max Value at which the Container should be fully visible eg.
  /// it will be fully visible at 0.6 because we set it to 1 in our opacity widget
  final double maxOpacityValue;

  /// Controller to access the Contents of the TextField
  final TextEditingController _controller = TextEditingController();

  /// Callback when the Send Button is pressed
  final Function(String msg)? onSendMessagePressed;

  ChatContainer({
    super.key,
    required this.value,
    this.minOpacityValue = 0.2,
    this.maxOpacityValue = 0.6,
    this.onSendMessagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PoiViewCubit, PoiViewState>(
      listenWhen: (previous, current) =>
          previous.commentStatus != current.commentStatus,
      listener: (context, state) {
        // Reset the TextField
        if (state.commentStatus is ScreenStatusSuccess) {
          _controller.clear();
        }
      },
      child: Visibility(
        visible: value > minOpacityValue,
        child: Opacity(
          opacity: (value > maxOpacityValue) ? 1 : value,
          child: Container(
            decoration: const BoxDecoration(
              color: tabBarBg,
              border: Border(
                top: BorderSide(width: 2.0, color: Colors.white70),
              ),
            ),
            height: Platform.isAndroid ? 90 : 120,
            width: MediaQuery.sizeOf(context).width,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _ChatTextField(
                  controller: _controller,
                  onSendMessagePressed: onSendMessagePressed,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatTextField extends StatelessWidget {
  final TextEditingController controller;

  /// Callback when the Send Button is pressed
  final Function(String msg)? onSendMessagePressed;

  const _ChatTextField({
    required this.controller,
    this.onSendMessagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        // If not logged in, show a Button to login
        if (state.user == null) {
          return Container(
            alignment: Alignment.center,
            child: RoundedButton(
              onPressed: () => context.pushNamed(LoginPageProvider.routeName),
              backgroundColor: primary.withOpacity(0.16),
              foregroundColor: primary,
              text: "Einloggen.",
            ),
          );
        }

        return Row(
          children: [
            // Message TextField
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white70),
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Kommentar schreiben.",
                  hintStyle: TextStyle(color: Colors.white70.withAlpha(150)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10),
                ),
                onSubmitted: (value) => _onSendMessagePressed(context, value),
              ),
            ),

            // Send Button
            SizedBox(
              width: 48,
              height: 48,
              child: TextButton(
                onPressed: () =>
                    _onSendMessagePressed(context, controller.text),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Icon(Icons.send),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Send the entered Message as comment for the current strategy
  Future<void> _onSendMessagePressed(BuildContext context, String value) async {
    // Trim the value to remove any whitespaces
    var trimmedValue = value.trim();

    // Unfocus the TextField
    FocusScope.of(context).unfocus();

    // Message is empty, do nothing
    if (trimmedValue.isEmpty) return;

    // Send the Message (this will be handled by the Parent Widget)
    onSendMessagePressed?.call(trimmedValue);
  }
}
