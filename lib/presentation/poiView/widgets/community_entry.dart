import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entities/comments_response.dart';
import 'package:flutter_app/entities/poi.dart';
import 'package:flutter_app/presentation/poiView/poi_view_provider.dart';
import 'package:flutter_app/presentation/poiView/widgets/touchable_opacity.dart';
import 'package:flutter_app/presentation/poiView/widgets/user_avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../entities/user.dart';
import '../../../theme/colors.dart';

class CommunityEntry<C extends StateStreamable<S>, S> extends StatelessWidget {
  final Poi? poi;

  /// Comment to display
  final CommentsResponse? comment;

  /// User to display
  final User? user;

  /// Callback when the entry is tapped
  final VoidCallback? onTap;

  /// Constructor
  CommunityEntry({super.key, this.user, this.onTap, this.comment, this.poi});

  void _defaultTapBehavior(BuildContext context) => context.pushNamed(
        PoiViewProvider.routeName,
      );

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap != null
          ? () => onTap?.call()
          : () => _defaultTapBehavior(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xff1c1e24),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding
            if (user == null) const SizedBox(height: 4),

            // Header with User Avatar

            _Header(
              user: comment?.commenter ?? comment?.commenter ?? user,
              comment: comment,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${comment?.actualcomment?.substring(0, min(comment!.actualcomment!.length, 150))}${150 < comment!.actualcomment!.length ? "..." : ""}" ??
                    "GENERAL.UNKNOWN".tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white70),
              ),
            ),

            // Thumbnail & Title & Description

            // Padding
            const SizedBox(height: 8),

            // Divider
            Divider(color: Colors.white.withOpacity(0.03), height: 1),
          ],
        ),
      ),
    );
  }
}

class _Stats<C extends StateStreamable<S>, S> extends StatelessWidget {
  final int? hotness;
  final double? hotnessGradient;
  final int? comments;
  final VoidCallback? onCommentPressed;

  const _Stats({
    this.hotness,
    this.comments,
    this.onCommentPressed,
    this.hotnessGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Hot or Cold
          if (hotness != null) ...[
            // Value
            //HotOrCold<C, S>(
            // hotness: hotness ?? 0,
            //hotnessGradient: hotnessGradient ?? 0.5,
            //),

            // Padding
            const SizedBox(width: 8),
          ],

          // Comment Button
          if (comments != null)
            _CommentButton(
              comments: comments,
              onPressed: () => onCommentPressed?.call(),
            ),
        ],
      ),
    );
  }
}

class _CommentButton extends StatelessWidget {
  final int? comments;

  final VoidCallback? onPressed;

  const _CommentButton({this.comments, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: FilledButton(
        // Set the background color to primary
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            primary.withOpacity(0.4),
          ),
          foregroundColor: MaterialStateProperty.all(primary),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
        onPressed: () => onPressed?.call(),
        child: Row(
          children: [
            // Icon
            const Icon(Icons.comment_outlined, size: 16),

            // Padding
            const SizedBox(width: 10),

            // Value
            Text(
              "${comments ?? 0}",
              style: const TextStyle(height: 0),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final User? user;
  final CommentsResponse? comment;

  const _Header({this.user, this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          // User Avatar
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: UserAvatar(
              showName: true,
              user: user,
              comment: comment,
              time: comment?.createdAt,
            ),
          ),
        ],
      ),
    );
  }
}
