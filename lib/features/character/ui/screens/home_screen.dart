import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rick_morty/app/router.gr.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: SearchAppBar(
        onSearch: (value) {
          context.router.push(
            SearchCharacterRoute(
              params: GetCharactersByFilterParams(
                name: value,
              ),
            ),
          );
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CharacterBloc>().add(
                const CharacterEvent.getCharacters(),
              );
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(8.h),
                BlocBuilder<CharacterBloc, CharacterState>(
                  builder: (context, state) {
                    final int count = state is CharacterStateLoaded
                        ? state.characters.length
                        : 0;
                    return Row(
                      children: [
                        TitleLarge('Characters ($count)'),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            context.read<CharacterBloc>().add(
                                  const CharacterEvent.getCharacters(),
                                );
                          },
                        ),
                      ],
                    );
                  },
                ),
                Gap(4.h),
                BlocBuilder<CharacterBloc, CharacterState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () {
                        final fakeCharacters =
                            List.generate(10, (index) => CharacterModel.fake());
                        return ListCharacter(
                          characters: fakeCharacters,
                          isLoading: true,
                        );
                      },
                      loaded: (characters) {
                        return ListCharacter(
                          characters: characters,
                        );
                      },
                      error: (message) {
                        return Center(
                          child: BoxWrapper(
                            child: Text(message),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
