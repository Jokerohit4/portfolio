import 'package:auto_route/auto_route.dart';
import 'package:nimbus/presentation/pages/home/home_page.dart';
import 'package:nimbus/presentation/pages/phool_gobhi/phool_gobhi_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        // Its own URL so the case study can be sent to an investor directly.
        AutoRoute(page: PhoolGobhiRoute.page, path: '/phool-gobhi'),
      ];
}
