import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/app/router.gr.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

class ListLocation extends StatelessWidget {
  final List<LocationEntity> locations;
  final bool isLoading;
  final ScrollController? scrollController;
  final double? height;

  const ListLocation({
    super.key,
    required this.locations,
    this.isLoading = false,
    this.scrollController,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BoxWrapper(
      height: height ?? 560.h,
      child: ListWrapper<LocationEntity>(
        items: locations,
        isLoading: isLoading,
        scrollController: scrollController,
        itemBuilder: (location) {
          return ListTileBoxWrapper(
            title: location.name,
            isFavorite: location.isFavorite,
            subtitle: location.type,
            showChevron: true,
            onTap: () {
              context.router.push(
                LocationDetailRoute(id: location.id, location: location),
              );
            },
          );
        },
      ),
    );
  }
}
