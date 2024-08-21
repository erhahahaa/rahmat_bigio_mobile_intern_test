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
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late ScrollController _scrollController;

  void _listenScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<LocationBloc>().add(
              LocationEvent.nextPage(),
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
            SearchLocationRoute(
              params: GetLocationsByFilterParams(
                name: value,
                type: value,
                dimension: value,
              ),
            ),
          );
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<LocationBloc>().add(
                const LocationEvent.getLocations(),
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
                BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    final int count = state is LocationStateLoaded
                        ? state.locations.results.length
                        : 0;
                    return Row(
                      children: [
                        TitleLarge('${context.str?.locations} ($count)'),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            context.read<LocationBloc>().add(
                                  const LocationEvent.getLocations(),
                                );
                          },
                        ),
                      ],
                    );
                  },
                ),
                Gap(4.h),
                BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () {
                        final fakeLocations =
                            List.generate(10, (index) => LocationModel.fake());
                        return ListLocation(
                          locations: fakeLocations,
                          isLoading: true,
                        );
                      },
                      loaded: (locations) {
                        return ListLocation(
                          scrollController: _scrollController,
                          locations: locations.results,
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
