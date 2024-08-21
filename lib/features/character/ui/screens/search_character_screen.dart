import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@RoutePage()
class SearchCharacterScreen extends StatelessWidget
    implements AutoRouteWrapper {
  final GetCharactersByFilterParams params;

  const SearchCharacterScreen({
    super.key,
    required this.params,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CharacterBloc>()
        ..add(
          CharacterEvent.getFilteredCharacters(params),
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text('Search Character'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.read<CharacterBloc>().add(
                  CharacterEvent.restoreCharacters(),
                );
            context.router.back();
          },
        ),
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () {
              final fakeCharacters =
                  List.generate(10, (index) => CharacterModel.fake());

              return ListCharacter(
                height: 650.h,
                characters: fakeCharacters,
                isLoading: true,
              );
            },
            loaded: (characters) {
              return ListCharacter(
                height: 650.h,
                characters: characters.results,
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
