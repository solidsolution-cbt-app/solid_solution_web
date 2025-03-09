// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:solidsolutionweb/features/authentication/views/category_screen.dart'
    as _i2;
import 'package:solidsolutionweb/features/authentication/views/login_screen.dart'
    as _i3;
import 'package:solidsolutionweb/features/authentication/views/select_category_route.dart'
    as _i5;
import 'package:solidsolutionweb/features/blog/views/blog_screen.dart' as _i1;
import 'package:solidsolutionweb/features/post_utme/views/post_utme_base_route.dart'
    as _i4;
import 'package:solidsolutionweb/features/utme/views/utme_base_route.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    BlogRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BlogScreen(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CategoryScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    PostUtmeBaseRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PostUtmeBaseRoute(),
      );
    },
    SelectCategoryRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SelectCategoryScreen(),
      );
    },
    UtmeBaseRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.UtmeBaseRoute(),
      );
    },
  };
}

/// generated route for
/// [_i1.BlogScreen]
class BlogRoute extends _i7.PageRouteInfo<void> {
  const BlogRoute({List<_i7.PageRouteInfo>? children})
      : super(
          BlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoryScreen]
class CategoryRoute extends _i7.PageRouteInfo<void> {
  const CategoryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PostUtmeBaseRoute]
class PostUtmeBaseRoute extends _i7.PageRouteInfo<void> {
  const PostUtmeBaseRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PostUtmeBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeBaseRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SelectCategoryScreen]
class SelectCategoryRoute extends _i7.PageRouteInfo<void> {
  const SelectCategoryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SelectCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectCategoryRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.UtmeBaseRoute]
class UtmeBaseRoute extends _i7.PageRouteInfo<void> {
  const UtmeBaseRoute({List<_i7.PageRouteInfo>? children})
      : super(
          UtmeBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'UtmeBaseRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
