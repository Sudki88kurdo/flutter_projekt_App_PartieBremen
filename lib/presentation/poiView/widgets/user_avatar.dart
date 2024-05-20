import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/poiView/widgets/touchable_opacity.dart';
import 'package:flutter_app/entities/comments_response.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../entities/user.dart';

class UserAvatar extends StatelessWidget {
  /// User to display in the avatar
  final User? user;

  /// Callback when the User was pressed
  final VoidCallback? onUserPressed;

  /// Show the name of the user below the avatar
  final bool showName;

  /// Widget to display after the name
  final Widget? nameSuffix;

  final DateTime? time;

  final CommentsResponse? comment;

  const UserAvatar({
    super.key,
    this.user,
    this.onUserPressed,
    this.showName = false,
    this.time,
    this.nameSuffix,
    this.comment,
  });

  @override
  Widget build(BuildContext context) {
    // if no user is provided, don't show the avatar
    if (user == null) {
      return const SizedBox();
    }

    // if showName is true, show the name of the user next to the avatar
    if (showName) {
      return TouchableOpacity(
        onTap: () => onUserPressed?.call(),
        child: Row(
          children: [
            // Avatar
            _Avatar(file: null),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username
                      AutoSizeText(
                        user?.name ?? "GENERAL.UNKNOWN".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.white70),
                      ),

                      // Name Suffix
                      nameSuffix ?? const SizedBox.shrink(),
                    ],
                  ),
                  if (time != null)
                    Text(
                      timeago.format(time!, allowFromNow: true),
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Colors.white70),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return IconButton(
      onPressed: () => onUserPressed?.call(),
      icon: _Avatar(
        file: null,
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final File? file;

  const _Avatar({required this.file});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 16,
        backgroundImage: file != null ? FileImage(file!) : null);
  }
}
