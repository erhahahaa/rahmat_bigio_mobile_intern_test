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
class LocationDetailScreen extends StatefulWidget {
  final int id;
  final LocationEntity location;

  const LocationDetailScreen({
    super.key,
    @pathParam required this.id,
    required this.location,
  });

  @override
  State<LocationDetailScreen> createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.location.isFavorite;
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
              title: TitleLarge(widget.location.name),
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
                  context.read<LocationBloc>().add(
                        LocationEvent.toggleFavorite(
                          ByIdParam(id: widget.location.id),
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
                  TitleLarge(context.str?.location_info),
                  Gap(8.h),
                  ListTileBoxWrapper(
                    title: context.str?.type ?? 'Type',
                    subtitle: widget.location.type,
                  ),
                  ListTileBoxWrapper(
                    title: context.str?.dimension ?? 'Dimension',
                    subtitle: widget.location.dimension,
                  ),
                  ListTileBoxWrapper(
                    title: context.str?.residents ?? 'Residents',
                    subtitle: widget.location.residents.length.toString(),
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
