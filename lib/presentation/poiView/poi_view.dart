import 'package:flutter/material.dart';
import 'package:flutter_app/entities/comments_response.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_app/presentation/app/app_state.dart';
import 'package:flutter_app/presentation/home-screen/home_screen.dart';
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

import '../../appStyle.dart';
import '../../common/no_items_found_error.dart';
import '../../theme/colors.dart';

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
            comment: item,
          );
        },
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      shrinkWrapFirstPageIndicators: true,
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
        );
      },
    );
  }
}

class _DownVotesCount extends StatelessWidget {
  const _DownVotesCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      buildWhen: (previous, current) =>
          previous.votings.length != current.votings.length,
      builder: (context, state) {
        return _StatisticsItem(
          icon: Icons.arrow_downward,
          title: "Down",
          value: "${state.votings.length}",
        );
      },
    );
  }
}

class _UpVotesCount extends StatelessWidget {
  const _UpVotesCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      buildWhen: (previous, current) =>
          previous.votings.length != current.votings.length,
      builder: (context, state) {
        return _StatisticsItem(
          icon: Icons.arrow_upward,
          title: "Up",
          value: "${state.votings.length}",
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

        // Get the title
        var title = creationData.year > 0
            ? "Erstellung"
            : creationData.month > 0
                ? "Erstellungsmonat"
                : "Erstellungstag";

        // Get the value
        var value = creationData.year > 0
            ? creationData.year.toInt()
            : creationData.month > 0
                ? creationData.month.toInt()
                : creationData.day.toInt();

        return _StatisticsItem(
          icon: Icons.calendar_today,
          title: title,
          value: "$value",
        );
      },
    );
  }
}

class _StatisticsItem extends StatelessWidget {
  final String? title;
  final String? value;
  final IconData? icon;

  const _StatisticsItem({
    super.key,
    this.title,
    this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon
        Icon(icon ?? Icons.abc, color: Colors.white70, size: 25),

        // Padding
        const SizedBox(height: 5),

        // Value and Title
        Text(
          title ?? "Konnte nicht geladen werden",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.white70),
        ),
        Text(
          value ?? "0",
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.white70),
        ),
      ],
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
      margin: const EdgeInsets.only(left: 16, top: 18, bottom: 12, right: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xff1c1e24),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _CommentCount(),
              _Divider(),
              _UpVotesCount(),
              _Divider(),
              _DownVotesCount(),
              _Divider(),
              _AccountCreationValue(),
            ],
          ),
          BlocBuilder<PoiViewCubit, PoiViewState>(
            buildWhen: (prev, curr) =>
                prev.poi?.description != null && curr.poi?.description != null,
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
        ],
      ),
    );
  }
}

class _PoIData extends StatelessWidget {
  const _PoIData({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        // Statistics
        const SliverToBoxAdapter(child: _Comments()),

        // Paginated List of Public Posts
        BlocBuilder<PoiViewCubit, PoiViewState>(
          buildWhen: (prev, current) =>
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
              pagingController: state.pagingController,
            );
          },
        ),
      ],
    );
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
                appBar: AppBar(
                  title: Text(
                    state.poi!.titel!,
                    style: AppStyles.appBarTitleStyle,
                  ),
                  backgroundColor: AppStyles.buttonColor,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      context.pushNamed(HomeScreen.routeName);
                    },
                  ),
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
                body: Stack(
                  children: [
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            child: FlutterMap(
                              mapController: _mapController,
                              options: MapOptions(
                                initialCenter: LatLng(state.poi!.latitude!,
                                    state.poi!.longitude!),
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
                        ),
                        const _PoIData(),
                      ],
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
                              .writeComment(
                                  msg, context.read<AppCubit>().state.user!),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : CircularProgressIndicator();
      },
    );
  }
}
