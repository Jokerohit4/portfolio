// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
part of 'router.dart';

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(),
      );
    },
    ProjectDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ProjectDetailPage(
          projectId: pathParams.getString('projectId'),
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProjectDetailPage]
class ProjectDetailRoute extends _i2.PageRouteInfo<ProjectDetailRouteArgs> {
  ProjectDetailRoute({
    required String projectId,
    List<_i2.PageRouteInfo>? children,
  }) : super(
    ProjectDetailRoute.name,
    args: ProjectDetailRouteArgs(projectId: projectId),
    rawPathParams: {'projectId': projectId},
    initialChildren: children,
  );

  static const String name = 'ProjectDetailRoute';

  static const _i2.PageInfo<ProjectDetailRouteArgs> page =
      _i2.PageInfo<ProjectDetailRouteArgs>(name);
}

class ProjectDetailRouteArgs {
  const ProjectDetailRouteArgs({required this.projectId});

  final String projectId;

  @override
  String toString() => 'ProjectDetailRouteArgs(projectId: $projectId)';
}
