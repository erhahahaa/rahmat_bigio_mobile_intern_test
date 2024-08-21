import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@RoutePage()
class EpisodeDetailScreen extends StatefulWidget {
  final int id;
  final EpisodeEntity episode;

  const EpisodeDetailScreen({
    super.key,
    @pathParam required this.id,
    required this.episode,
  });

  @override
  State<EpisodeDetailScreen> createState() => _EpisodeDetailScreenState();
}

class _EpisodeDetailScreenState extends State<EpisodeDetailScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.episode.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: AppConstants.FALLBACK_IMAGE_URL,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black.withOpacity(0.5),
              ),
              title: TitleLarge(widget.episode.name),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  context.read<EpisodeBloc>().add(
                        EpisodeEvent.toggleFavorite(
                          ByIdParam(id: widget.episode.id),
                        ),
                      );
                },
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Gap(8.h),
                  TitleLarge(context.str?.episode_info),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.episode ?? 'Episode',
                    subtitle: widget.episode.episode,
                  ),
                  ListTileBoxWrapper(
                    title: context.str?.air_date ?? 'Air Date',
                    subtitle: widget.episode.airDate,
                  ),
                  ListTileBoxWrapper(
                    title: context.str?.created_at ?? 'Created',
                    subtitle: widget.episode.created?.toIso8601String() ?? '',
                  ),
                  ListTileBoxWrapper(
                    title: context.str?.episode_id ?? 'Episode ID',
                    subtitle: widget.episode.id.toString(),
                  ),
                  ListTileBoxWrapper(
                    title: context.str?.url ?? 'URL',
                    subtitle: widget.episode.url,
                  ),
                  Gap(8.h),
                  const TitleLarge('Other Info'),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.name ?? 'Name',
                    subtitle: widget.episode.name,
                  ),
                  ListTileBoxWrapper(
                    title: context.str?.url ?? 'URL',
                    subtitle: widget.episode.url,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
