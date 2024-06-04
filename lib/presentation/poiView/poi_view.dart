import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entities/comments_response.dart';
import 'package:flutter_app/entities/petition_response.dart';
import 'package:flutter_app/entities/survey_response.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_app/presentation/app/app_state.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_app/presentation/poiView/widgets/chat_container.dart';
import 'package:flutter_app/presentation/poiView/widgets/community_entry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocode/geocode.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/no_items_found_error.dart';
import '../../theme/colors.dart';
import '../home-screen/home_screen.dart';

class CommentsList<C extends StateStreamable<S>, S> extends StatelessWidget {
  final Widget? noItems;
  final Widget? loadingIndicator;
  final Widget? errorIndicator;
  final Widget? noMoreItems;

  final PagingController<int, CommentsResponse> pagingController;

  const CommentsList({
    super.key,
    this.noItems,
    this.loadingIndicator,
    this.errorIndicator,
    this.noMoreItems,
    required this.pagingController,
  });

  @override
  Widget build(BuildContext context) {
    return PagedSliverList.separated(
      builderDelegate: PagedChildBuilderDelegate<CommentsResponse>(
        itemBuilder: (context, item, index) {
          return CommunityEntry(
            user: item.commenter,
            poi: context.read<PoiViewCubit>().state.poi,
            createdAt: item.createdAt,
            text: item.actualcomment ?? '',
          );
        },
        noItemsFoundIndicatorBuilder: (context) =>
            noItems ?? const NoItemsFoundError(),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      shrinkWrapFirstPageIndicators: false,
      pagingController: pagingController,
    );
  }
}

class SurveyList<C extends StateStreamable<S>, S> extends StatelessWidget {
  final Widget? noItems;
  final Widget? loadingIndicator;
  final Widget? errorIndicator;
  final Widget? noMoreItems;

  final PagingController<int, SurveyResponse> pagingController;

  const SurveyList({
    super.key,
    this.noItems,
    this.loadingIndicator,
    this.errorIndicator,
    this.noMoreItems,
    required this.pagingController,
  });

  @override
  Widget build(BuildContext context) {
    return PagedSliverList.separated(
      builderDelegate: PagedChildBuilderDelegate<SurveyResponse>(
        itemBuilder: (context, item, index) {
          return CommunityEntry(
            user: item.creator,
            poi: context.read<PoiViewCubit>().state.poi,
            createdAt: item.createdAt,
            text: (item.titel ?? '') + ('\n\n${item.beschreibung!}' ?? ''),
          );
        },
        noItemsFoundIndicatorBuilder: (context) =>
            noItems ?? const NoItemsFoundError(),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      shrinkWrapFirstPageIndicators: false,
      pagingController: pagingController,
    );
  }
}

class PetitionList<C extends StateStreamable<S>, S> extends StatelessWidget {
  final Widget? noItems;
  final Widget? loadingIndicator;
  final Widget? errorIndicator;
  final Widget? noMoreItems;

  final PagingController<int, PetitionResponse> pagingController;

  const PetitionList({
    super.key,
    this.noItems,
    this.loadingIndicator,
    this.errorIndicator,
    this.noMoreItems,
    required this.pagingController,
  });

  @override
  Widget build(BuildContext context) {
    return PagedSliverList.separated(
      builderDelegate: PagedChildBuilderDelegate<PetitionResponse>(
        itemBuilder: (context, item, index) {
          return PetitionEntry(
            user: context.read<AppCubit>().state.user!,
            poi: context.read<PoiViewCubit>().state.poi,
            createdAt: item.createdAt,
            text: item.titel ?? '',
            description: item.description! ?? '',
            petitionResponse: item,
          );
        },
        noItemsFoundIndicatorBuilder: (context) =>
            noItems ?? const NoItemsFoundError(),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      shrinkWrapFirstPageIndicators: false,
      pagingController: pagingController,
    );
  }
}

class _CommentCount extends StatelessWidget {
  const _CommentCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      buildWhen: (previous, current) =>
          previous.comments.length != current.comments.length,
      builder: (context, state) {
        return _StatisticsItem(
          icon: Icons.comment,
          title: "Kommentare",
          value: "${state.comments.length}",
          index: 0,
        );
      },
    );
  }
}

class _Surveys extends StatelessWidget {
  const _Surveys({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      buildWhen: (previous, current) =>
          previous.surveys.length != current.surveys.length,
      builder: (context, state) {
        return _StatisticsItem(
          icon: Icons.question_answer,
          title: "Umfragen",
          value: "${state.surveys.length}",
          index: 1,
        );
      },
    );
  }
}

class _Petitions extends StatelessWidget {
  const _Petitions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      buildWhen: (previous, current) =>
          previous.petitions.length != current.petitions.length,
      builder: (context, state) {
        return _StatisticsItem(
          icon: Icons.local_post_office,
          title: "Petitionen",
          value: "${state.petitions.length}",
          index: 2,
        );
      },
    );
  }
}

class _AccountCreationValue extends StatelessWidget {
  const _AccountCreationValue({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var creationData = state.user!.dob;
        // Get the value
        var value = creationData.year > 0
            ? creationData.year.toInt()
            : creationData.month > 0
                ? creationData.month.toInt()
                : creationData.day.toInt();

        return Column(
          children: [
            // Icon
            const Icon(Icons.calendar_today, color: Colors.white70, size: 25),

            // Padding
            const SizedBox(height: 5),

            Text(
              "$value",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white70),
            ),
          ],
        );
      },
    );
  }
}

class _StatisticsItem extends StatelessWidget {
  final String? title;
  final String? value;
  final IconData? icon;
  final int index;

  const _StatisticsItem({
    super.key,
    this.title,
    this.value,
    this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      buildWhen: (prev, curr) => prev.listIndex != curr.listIndex,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<PoiViewCubit>().updateIndex(index),
          child: Container(
            decoration: BoxDecoration(
                color: state.listIndex == index
                    ? Color(0xff24262c)
                    : Color(0xff1c1e24),
                borderRadius: BorderRadius.circular(32)),
            width: MediaQuery.of(context).size.width / 4.22,
            child: Column(
              children: [
                // Icon
                Icon(icon ?? Icons.abc, color: Colors.white70, size: 25),

                // Padding
                const SizedBox(height: 5),

                // Value and Title
                title != null
                    ? Text(
                        title ?? "Konnte nicht geladen werden",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white70),
                      )
                    : Container(),
                Text(
                  value ?? "0",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 52,
      color: white.withOpacity(0.16),
    );
  }
}

class _Comments extends StatelessWidget {
  const _Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xff1c1e24),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: CustomScrollView(
        shrinkWrap: false,
        slivers: [
          MultiSliver(
            children: [
              CupertinoSliverRefreshControl(
                onRefresh: () async =>
                    context.read<PoiViewCubit>().refreshControllers(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<PoiViewCubit, PoiViewState>(
                    buildWhen: (prev, curr) =>
                        prev.poi?.titel != null && curr.poi?.titel != null,
                    builder: (context, state) {
                      return state.poi!.titel!.isNotEmpty
                          ? Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  top: 6,
                                  right: 20,
                                ),
                                child: Text(
                                  state.poi!.titel!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: Colors.white70, fontSize: 20),
                                ),
                              ),
                            )
                          : const Text("");
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, top: 8),
                    child: _AccountCreationValue(),
                  ),
                ],
              ),
              BlocBuilder<PoiViewCubit, PoiViewState>(
                buildWhen: (prev, curr) =>
                    prev.poi?.description != null &&
                    curr.poi?.description != null,
                builder: (context, state) {
                  return state.poi!.description!.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.poi!.description!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white70),
                          ),
                        )
                      : const Text("");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _CommentCount(),
                  _Divider(),
                  _Surveys(),
                  _Divider(),
                  _Petitions(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const _List(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      builder: (context, state) {
        if (state.listIndex == 0) {
          return BlocBuilder<PoiViewCubit, PoiViewState>(
            buildWhen: (prev, current) =>
                prev.comments.isEmpty ||
                prev.comments.length != current.comments.length ||
                prev.comments.isEmpty && current.comments.isNotEmpty,
            builder: (context, state) {
              return CommentsList<PoiViewCubit, PoiViewState>(
                // TODO: Somehow the default Loading Indicator with Shimmers is bugged
                // but just here... In the Hub it's working fine..
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                noItems: NoItemsFoundError(
                  text: "Keine Posts",
                ),
                pagingController: state.commentsPagingController,
              );
            },
          );
        }
        if (state.listIndex == 1) {
          return BlocBuilder<PoiViewCubit, PoiViewState>(
            buildWhen: (prev, current) =>
                prev.surveys.isEmpty ||
                prev.surveys.length != current.surveys.length ||
                prev.surveys.isEmpty && current.surveys.isNotEmpty,
            builder: (context, state) {
              return SurveyList<PoiViewCubit, PoiViewState>(
                // TODO: Somehow the default Loading Indicator with Shimmers is bugged
                // but just here... In the Hub it's working fine..
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                noItems: NoItemsFoundError(
                  text: "Keine Posts",
                ),
                pagingController: state.surveyPagingController,
              );
            },
          );
        }
        if (state.listIndex == 2) {
          return BlocBuilder<PoiViewCubit, PoiViewState>(
            buildWhen: (prev, current) =>
                prev.petitions.isEmpty ||
                prev.petitions.length != current.petitions.length ||
                prev.petitions.isEmpty && current.petitions.isNotEmpty,
            builder: (context, state) {
              return PetitionList<PoiViewCubit, PoiViewState>(
                // TODO: Somehow the default Loading Indicator with Shimmers is bugged
                // but just here... In the Hub it's working fine..
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                noItems: NoItemsFoundError(
                  text: "Keine Posts",
                ),
                pagingController: state.petitionPagingController,
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class _PoIData extends StatelessWidget {
  const _PoIData({super.key});

  @override
  Widget build(BuildContext context) {
    return _Comments();
  }
}

class PoiView extends StatelessWidget {
  const PoiView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      buildWhen: (prev, next) =>
          prev.poi != next.poi && (prev.poi != null || next.poi != null),
      builder: (context, state) {
        final MapController _mapController = MapController();
        GeoCode geoCode = GeoCode();
        return state.poi != null
            ? Scaffold(
                appBar: null,
                resizeToAvoidBottomInset: false,
                body: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(height: MediaQuery.of(context).size.height),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: FlutterMap(
                            mapController: _mapController,
                            options: MapOptions(
                              initialCenter: LatLng(
                                  state.poi!.latitude!, state.poi!.longitude!),
                              initialZoom: 17,
                              interactionOptions: const InteractionOptions(
                                flags: InteractiveFlag.drag |
                                    InteractiveFlag.flingAnimation |
                                    InteractiveFlag.pinchMove |
                                    InteractiveFlag.pinchZoom |
                                    InteractiveFlag.doubleTapZoom |
                                    InteractiveFlag.doubleTapDragZoom |
                                    InteractiveFlag.scrollWheelZoom,
                              ),
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: LatLng(
                                      state.poi!.latitude!,
                                      state.poi!.longitude!,
                                    ),
                                    width: 150.0,
                                    height: 150.0,
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 50.0,
                                    ),
                                  )
                                ],
                              ),
                              RichAttributionWidget(
                                attributions: [
                                  TextSourceAttribution(
                                    'OpenStreetMap contributors',
                                    onTap: () => launchUrl(Uri.parse(
                                        'https://openstreetmap.org/copyright')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xff1c1e24),
                            child: IconButton(
                              iconSize: 20,
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                context.pushNamed(HomeScreen.routeName);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width - 50,
                            top: 80,
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xff1c1e24),
                                child: IconButton(
                                  iconSize: 20,
                                  icon: const Icon(
                                    Icons.thumb_up,
                                    color: Colors.white70,
                                  ),
                                  onPressed: () {
                                    context.read<PoiViewCubit>().createVote(
                                        VoteType.UP,
                                        context
                                            .read<AppCubit>()
                                            .state
                                            .user!
                                            .id!,
                                        poiId: state.poi!.id!);
                                  },
                                ),
                              ),
                              BlocBuilder<PoiViewCubit, PoiViewState>(
                                buildWhen: (prev, curr) =>
                                    prev.votings.length !=
                                        curr.votings.length ||
                                    prev.votings != curr.votings,
                                builder: (context, state) {
                                  return Text(
                                    "${state.votings.where((element) => element.voteType!.name == VoteType.UP.name).toList().length}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Colors.black54,
                                          fontSize: 20,
                                        ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width - 50,
                              top: 150),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xff1c1e24),
                                child: IconButton(
                                  iconSize: 20,
                                  icon: const Icon(
                                    Icons.thumb_down,
                                    color: Colors.white70,
                                  ),
                                  onPressed: () {
                                    context.read<PoiViewCubit>().createVote(
                                        VoteType.DOWN,
                                        context
                                            .read<AppCubit>()
                                            .state
                                            .user!
                                            .id!,
                                        poiId: state.poi!.id!);
                                  },
                                ),
                              ),
                              BlocBuilder<PoiViewCubit, PoiViewState>(
                                buildWhen: (prev, curr) =>
                                    prev.votings.length !=
                                        curr.votings.length ||
                                    prev.votings != curr.votings,
                                builder: (context, state) {
                                  return Text(
                                    '${state.votings.where((element) => element.voteType!.name == VoteType.DOWN.name).toList().length}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Colors.black54,
                                          fontSize: 20,
                                        ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: _PoIData(),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.viewInsetsOf(context).bottom,
                            ),
                            child: ChatContainer(
                              value: 1,
                              onSendMessagePressed: (msg) => context
                                  .read<PoiViewCubit>()
                                  .writeComment(msg,
                                      context.read<AppCubit>().state.user!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : CircularProgressIndicator();
      },
    );
  }
}
