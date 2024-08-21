import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moon_design/moon_design.dart';
import 'package:rick_morty/app/router.gr.dart';
import 'package:rick_morty/app/sl.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CharacterBloc>()
        ..add(
          CharacterEvent.getCharacters(),
        ),
      child: this,
    );
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text(AppConstants.APP_NAME),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleLarge('Meta'),
              Gap(4.h),
              _buildInfo(context),
              Gap(12.h),
              TitleLarge('Characters'),
              Gap(4.h),
              SizedBox(
                height: 400.h,
                child: _buildList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        final List<CharacterEntity> characters = [];
        if (state is CharacterStateLoaded) {
          characters.addAll(state.characters);
        }

        return BoxWrapper(
          child: Row(
            children: [
              BoxWrapper(
                child: Column(
                  children: [
                    TitleLarge(characters.length.toString()),
                    BodySmall('Characters'),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildList(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        final List<CharacterEntity> characters = [];
        if (state is CharacterStateLoaded) {
          characters.addAll(state.characters);
        }

        return BoxWrapper(
          child: ListWrapper<CharacterEntity>(
            items: characters,
            itemBuilder: (character) {
              return BoxWrapper(
                padding: EdgeInsets.all(4.w),
                margin: EdgeInsets.symmetric(vertical: 4.h),
                color: context.moonColors?.frieza.withOpacity(0.05),
                child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: character.image,
                    width: 36.h,
                    height: 36.h,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      backgroundImage: imageProvider,
                    ),
                  ),
                  title: Text(character.name),
                  subtitle: Text(character.status.value),
                  onTap: () {
                    context.router.push(
                      DetailCharacterRoute(id: character.id),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
