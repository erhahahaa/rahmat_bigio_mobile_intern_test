import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidayatullah/app/router.gr.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';

class ListCharacter extends StatelessWidget {
  final List<CharacterEntity> characters;
  final bool isLoading;
  final ScrollController? scrollController;
  final double? height;

  const ListCharacter({
    super.key,
    required this.characters,
    this.isLoading = false,
    this.scrollController,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BoxWrapper(
      height: height ?? 560.h,
      child: ListWrapper<CharacterEntity>(
        items: characters,
        isLoading: isLoading,
        scrollController: scrollController,
        itemBuilder: (character) {
          return ListTileBoxWrapper(
            image: character.image,
            title: character.name,
            isFavorite: character.isFavorite,
            subtitle: character.status.value.capitalize(),
            showChevron: true,
            onTap: () {
              context.router.push(
                CharacterDetailRoute(id: character.id, character: character),
              );
            },
          );
        },
      ),
    );
  }
}
