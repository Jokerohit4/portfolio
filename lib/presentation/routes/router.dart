import 'package:auto_route/auto_route.dart' as _i2;
import 'package:auto_route/auto_route.dart';
import 'package:nimbus/presentation/pages/home/home_page.dart' as _i1;
import 'package:nimbus/presentation/pages/project_detail/project_detail_page.dart' as _i3;

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(
          page: ProjectDetailRoute.page,
          path: '/project/:projectId',
        ),
      ];
}
