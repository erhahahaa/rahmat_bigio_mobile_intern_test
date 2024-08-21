import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/app/router.gr.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

class ListEpisode extends StatelessWidget {
  final List<EpisodeEntity> episodes;
  final bool isLoading;
  final ScrollController? scrollController;
  final double? height;

  const ListEpisode({
    super.key,
    required this.episodes,
    this.isLoading = false,
    this.scrollController,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BoxWrapper(
      height: height ?? 560.h,
      child: ListWrapper<EpisodeEntity>(
        items: episodes,
        isLoading: isLoading,
        scrollController: scrollController,
        itemBuilder: (episode) {
          return ListTileBoxWrapper(
            title: episode.name,
            isFavorite: episode.isFavorite,
            subtitle: episode.airDate,
            showChevron: true,
            onTap: () {
              context.router.push(
                EpisodeDetailRoute(id: episode.id, episode: episode),
              );
            },
          );
        },
      ),
    );
  }
}
