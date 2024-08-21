import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/app/router.gr.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

class ListCharacter extends StatelessWidget {
  final List<CharacterEntity> characters;
  final bool isLoading;
  const ListCharacter({
    super.key,
    required this.characters,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return BoxWrapper(
      height: 560.h,
      child: ListWrapper<CharacterEntity>(
        items: characters,
        isLoading: isLoading,
        itemBuilder: (character) {
          return ListTileBoxWrapper(
            image: character.image,
            title: character.name,
            isFavorite: character.isFavorite,
            subtitle: character.status.value.capitalize(),
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
