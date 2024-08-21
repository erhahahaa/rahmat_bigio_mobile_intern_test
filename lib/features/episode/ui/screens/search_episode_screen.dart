import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@RoutePage()
class SearchEpisodeScreen extends StatelessWidget implements AutoRouteWrapper {
  final GetEpisodesByFilterParams params;

  const SearchEpisodeScreen({
    super.key,
    required this.params,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.read<EpisodeBloc>()
        ..add(
          EpisodeEvent.getFilteredEpisodes(params),
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text('Search Episode'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.read<EpisodeBloc>().add(
                  EpisodeEvent.restoreEpisodes(),
                );
            context.router.back();
          },
        ),
      ),
      body: BlocBuilder<EpisodeBloc, EpisodeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () {
              final fakeEpisodes =
                  List.generate(10, (index) => EpisodeModel.fake());

              return ListEpisode(
                height: 650.h,
                episodes: fakeEpisodes,
                isLoading: true,
              );
            },
            loaded: (episodes) {
              return ListEpisode(
                height: 650.h,
                episodes: episodes.results,
              );
            },
            error: (message) => Center(
              child: BoxWrapper(
                child: Text(message),
              ),
            ),
          );
        },
      ),
    );
  }
}
