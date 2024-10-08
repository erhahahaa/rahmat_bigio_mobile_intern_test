import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';

@RoutePage()
class CharacterDetailScreen extends StatefulWidget {
  final int id;
  final CharacterEntity character;

  const CharacterDetailScreen({
    super.key,
    @pathParam required this.id,
    required this.character,
  });

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.character.isFavorite;
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
                imageUrl: widget.character.image,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black.withOpacity(0.5),
              ),
              title: TitleLarge(widget.character.name),
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
                  context.read<CharacterBloc>().add(
                        CharacterEvent.toggleFavorite(
                          ByIdParam(id: widget.character.id),
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
                  TitleLarge(context.str?.details),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.status ?? 'Status',
                    subtitle: widget.character.status.value,
                  ),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.species ?? 'Species',
                    subtitle: widget.character.species,
                  ),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.type ?? 'Type',
                    subtitle: widget.character.type.isEmpty
                        ? 'Unknown'
                        : widget.character.type,
                  ),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.gender ?? 'Gender',
                    subtitle: widget.character.gender.value.capitalize(),
                  ),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.origin ?? 'Origin',
                    subtitle: widget.character.origin.name,
                  ),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.location ?? 'Location',
                    subtitle: widget.character.location.name,
                  ),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.episodes ?? 'Episodes',
                    subtitle: widget.character.episode.length.toString(),
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
