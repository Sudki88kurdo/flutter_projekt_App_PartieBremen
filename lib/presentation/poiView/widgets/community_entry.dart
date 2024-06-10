import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entities/petition_response.dart';
import 'package:flutter_app/entities/poi.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_provider.dart';
import 'package:flutter_app/presentation/poiView/widgets/survey_page.dart';
import 'package:flutter_app/presentation/poiView/widgets/touchable_opacity.dart';
import 'package:flutter_app/presentation/poiView/widgets/user_avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../entities/user.dart';
import '../../../theme/colors.dart';

class PetitionEntry<C extends StateStreamable<S>, S> extends StatelessWidget {
  final Poi? poi;

  final PetitionResponse? petitionResponse;

  /// User to display
  final User? user;

  /// Callback when the entry is tapped
  final VoidCallback? onTap;

  final DateTime? createdAt;

  final String? text;

  final String? description;

  final BuildContext blocBuilderContext;

  /// Constructor
  const PetitionEntry(
      {super.key,
      this.user,
      this.onTap,
      this.createdAt,
      this.poi,
      this.text,
      this.description,
      this.petitionResponse,
      required this.blocBuilderContext});

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
        decoration: BoxDecoration(
          color: const Color(0xff24262c),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 15,
            right: 10.0,
            bottom: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding
              if (user == null) const SizedBox(height: 4),

              Text(
                "${text?.substring(0, min(text!.length, 150))}${150 < text!.length ? "..." : ""}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white70, fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${petitionResponse?.description!}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white70, fontSize: 16),
              ),
              // Padding
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          //TODO Put progress value into here
                          value: (petitionResponse?.signatures!.length! ?? 1) /
                              (petitionResponse?.goal! == null ||
                                      petitionResponse?.goal! == 0
                                  ? 1
                                  : petitionResponse!.goal!),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              petitionResponse?.signatures!.length!
                                      .toString() ??
                                  '0',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.white70, fontSize: 16),
                            ),
                            Text(
                              petitionResponse!.goal!.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.white70, fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 30),
                    child: SizedBox(
                      child: IconButton(
                        iconSize: 20,
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          blocBuilderContext
                              .read<PoiViewCubit>()
                              .createSignature(
                                petitionId: petitionResponse!.id!,
                                userId: blocBuilderContext
                                    .read<AppCubit>()
                                    .state!
                                    .user!
                                    .id!,
                              );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // Divider
              Divider(color: Colors.white.withOpacity(0.03), height: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeDismissible(
          {required Widget child, required BuildContext context}) =>
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: GestureDetector(
            onTap: () {},
            child: child,
          ));
}

class CommunityEntry<C extends StateStreamable<S>, S> extends StatelessWidget {
  final Poi? poi;

  /// User to display
  final User? user;

  /// Callback when the entry is tapped
  final VoidCallback? onTap;

  final DateTime? createdAt;

  final String? text;

  /// Constructor
  const CommunityEntry(
      {super.key, this.user, this.onTap, this.createdAt, this.poi, this.text});

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
        decoration: BoxDecoration(
          color: const Color(0xff24262c),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding
            if (user == null) const SizedBox(height: 4),

            // Header with User Avatar
            _Header(
              user: user,
              createdAt: createdAt,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${text?.substring(0, min(text!.length, 150))}${150 < text!.length ? "..." : ""}" ??
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

class SurveyEntry<C extends StateStreamable<S>, S> extends StatelessWidget {
  final Poi? poi;

  /// User to display
  final User? user;

  /// Callback when the entry is tapped
  final VoidCallback? onTap;

  final DateTime? createdAt;

  final String? text;

  /// Constructor
  const SurveyEntry(
      {super.key, this.user, this.onTap, this.createdAt, this.poi, this.text});

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
        decoration: BoxDecoration(
          color: const Color(0xff24262c),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding
            if (user == null) const SizedBox(height: 4),

            // Header with User Avatar
            _Header(
              user: user,
              createdAt: createdAt,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${text?.substring(0, min(text!.length, 150))}${150 < text!.length ? "..." : ""}" ??
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

            Center(
              child: SizedBox(
                width: 200,
                child: FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () => context.pushNamed(SurveyPage.routeName),
                  child: Text(
                    "Mitmachen!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            // Divider
            const SizedBox(height: 16),
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
  final DateTime? createdAt;

  const _Header({this.user, this.createdAt});

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
              time: createdAt,
            ),
          ),
        ],
      ),
    );
  }
}
