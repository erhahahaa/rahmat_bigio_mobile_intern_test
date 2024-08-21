import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moon_design/moon_design.dart';
import 'package:rick_morty/app/router.gr.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@RoutePage()
class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: MoonTextInput(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(8.h),
              BlocBuilder<EpisodeBloc, EpisodeState>(
                builder: (context, state) {
                  final int count = state is EpisodeStateLoaded
                      ? state.episodes.length
                      : 0;
                  return TitleLarge('Episodes ($count)');
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
                      return _buildList(
                        context,
                        episodes: fakeEpisodes,
                        isLoading: true,
                      );
                    },
                    loaded: (episodes) {
                      return _buildList(context, episodes: episodes);
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
              // _buildList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(
    BuildContext context, {
    required List<EpisodeEntity> episodes,
    bool isLoading = false,
  }) {
    return BoxWrapper(
      height: 560.h,
      child: ListWrapper<EpisodeEntity>(
        items: episodes,
        isLoading: isLoading,
        itemBuilder: (episode) {
          return ListTileBoxWrapper( 
            title: episode.name,
            subtitle: episode.airDate,
            onTap: () {
              Log.error('Episode tapped: ${episode.name}');
              context.router.push(
                EpisodeDetailRoute(id: episode.id),
              );
            },
          );
        },
      ),
    );
  }
}
