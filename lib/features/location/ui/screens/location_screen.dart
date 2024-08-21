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
class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

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
              BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  final int count =
                      state is LocationStateLoaded ? state.locations.length : 0;
                  return TitleLarge('Locations ($count)');
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
                      return _buildList(
                        context,
                        locations: fakeLocations,
                        isLoading: true,
                      );
                    },
                    loaded: (locations) {
                      return _buildList(context, locations: locations);
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
    required List<LocationEntity> locations,
    bool isLoading = false,
  }) {
    return BoxWrapper(
      height: 560.h,
      child: ListWrapper<LocationEntity>(
        items: locations,
        isLoading: isLoading,
        itemBuilder: (location) {
          return ListTileBoxWrapper(
            title: location.name,
            subtitle: location.type,
            onTap: () {
              Log.error('Location tapped: ${location.name}');
              context.router.push(
                LocationDetailRoute(id: location.id),
              );
            },
          );
        },
      ),
    );
  }
}
