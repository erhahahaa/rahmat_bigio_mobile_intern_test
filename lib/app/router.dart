import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/app/router.gr.dart';

@Injectable()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        RedirectRoute(
          path: '/',
          redirectTo: '/character',
        ),
        AutoRoute(
          initial: true,
          path: '/character',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              path: ':id',
              page: DetailCharacterRoute.page,
            ),
            AutoRoute(
              path: 'search',
              page: SearchCharacterRoute.page,
            ),
          ],
        ),
      ];
}
