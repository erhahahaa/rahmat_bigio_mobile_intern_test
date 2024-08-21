import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rick_morty/app/router.gr.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@RoutePage()
class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({super.key});

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  late ScrollController _scrollController;

  void _listenScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<EpisodeBloc>().add(
              EpisodeEvent.nextPage(),
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
            SearchEpisodeRoute(
              params: GetEpisodesByFilterParams(
                name: value,
              ),
            ),
          );
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<EpisodeBloc>().add(
                const EpisodeEvent.getEpisodes(),
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
                BlocBuilder<EpisodeBloc, EpisodeState>(
                  builder: (context, state) {
                    final int count = state is EpisodeStateLoaded
                        ? state.episodes.results.length
                        : 0;
                    return Row(
                      children: [
                        TitleLarge('${context.str?.episodes} ($count)'),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            context.read<EpisodeBloc>().add(
                                  const EpisodeEvent.getEpisodes(),
                                );
                          },
                        ),
                      ],
                    );
                  },
                ),
                Gap(4.h),
                BlocBuilder<EpisodeBloc, EpisodeState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () {
                        final fakeEpisodes =
                            List.generate(10, (index) => EpisodeModel.fake());
                        return ListEpisode(
                          episodes: fakeEpisodes,
                          isLoading: true,
                        );
                      },
                      loaded: (episodes) {
                        return ListEpisode(
                          scrollController: _scrollController,
                          episodes: episodes.results,
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
