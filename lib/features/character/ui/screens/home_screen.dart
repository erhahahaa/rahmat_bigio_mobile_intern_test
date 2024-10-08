import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hidayatullah/app/router.gr.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  void _listenScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<CharacterBloc>().add(
              const CharacterEvent.nextPage(),
            );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _listenScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: SearchAppBar(
        onSearch: (value) {
          context.router.push(
            SearchCharacterRoute(
              params: GetCharactersByFilterParams(
                name: value,
                species: value,
                type: value,
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
                        ? state.characters.results.length
                        : 0;
                    return Row(
                      children: [
                        TitleLarge('${context.str?.characters} ($count)'),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.refresh),
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
                          scrollController: _scrollController,
                          characters: characters.results,
                        );
                      },
                      error: (failure) {
                        return Center(
                          child: BoxWrapper(
                            child: Column(
                              children: [
                                Text(failure.message),
                                Gap(8.h),
                                Text(failure.toString()),
                              ],
                            ),
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
