import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@RoutePage()
class SearchLocationScreen extends StatelessWidget implements AutoRouteWrapper {
  final GetLocationsByFilterParams params;

  const SearchLocationScreen({
    super.key,
    required this.params,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.read<LocationBloc>()
        ..add(
          LocationEvent.getFilteredLocations(params),
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text('Search Location'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.read<LocationBloc>().add(
                  LocationEvent.restoreLocations(),
                );
            context.router.back();
          },
        ),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () {
              final fakeLocations =
                  List.generate(10, (index) => LocationModel.fake());

              return ListLocation(
                height: 650.h,
                locations: fakeLocations,
                isLoading: true,
              );
            },
            loaded: (locations) {
              return ListLocation(
                height: 650.h,
                locations: locations.results,
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
