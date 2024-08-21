import 'package:auto_route/auto_route.dart';
import 'package:hidayatullah/app/router.gr.dart';
import 'package:injectable/injectable.dart';

@Injectable()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: DashboardRoute.page,
          children: [
            AutoRoute(
              initial: true,
              path: 'character',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'episode',
              page: EpisodeRoute.page,
            ),
            AutoRoute(
              path: 'location',
              page: LocationRoute.page,
            ),
            AutoRoute(
              path: 'settings',
              page: SettingsRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/character/:id',
          page: CharacterDetailRoute.page,
        ),
        AutoRoute(
          path: '/character/search',
          page: SearchCharacterRoute.page,
        ),
        AutoRoute(
          path: '/episode/:id',
          page: EpisodeDetailRoute.page,
        ),
        AutoRoute(
          path: '/episode/search',
          page: SearchEpisodeRoute.page,
        ),
        AutoRoute(
          path: '/location/:id',
          page: LocationDetailRoute.page,
        ),
        AutoRoute(
          path: '/location/search',
          page: SearchLocationRoute.page,
        ),
      ];
}
