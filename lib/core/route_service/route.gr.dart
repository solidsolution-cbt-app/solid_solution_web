// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:solidsolutionweb/features/authentication/views/category_screen.dart'
    as _i2;
import 'package:solidsolutionweb/features/authentication/views/login_screen.dart'
    as _i3;
import 'package:solidsolutionweb/features/authentication/views/select_category_route.dart'
    as _i6;
import 'package:solidsolutionweb/features/blog/views/blog_screen.dart' as _i1;
import 'package:solidsolutionweb/features/blog/views/preview_blog_screen.dart'
    as _i5;
import 'package:solidsolutionweb/features/blog/views/upload_blog_screen.dart'
    as _i7;
import 'package:solidsolutionweb/features/post_utme/views/post_utme_base_route.dart'
    as _i4;
import 'package:solidsolutionweb/features/utme/views/utme_base_route.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    BlogRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BlogScreen(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CategoryScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    PostUtmeBaseRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PostUtmeBaseRoute(),
      );
    },
    PreviewBlogRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PreviewBlogScreen(),
      );
    },
    SelectCategoryRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SelectCategoryScreen(),
      );
    },
    UploadBlogRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.UploadBlogScreen(),
      );
    },
    UtmeBaseRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.UtmeBaseRoute(),
      );
    },
  };
}

/// generated route for
/// [_i1.BlogScreen]
class BlogRoute extends _i9.PageRouteInfo<void> {
  const BlogRoute({List<_i9.PageRouteInfo>? children})
      : super(
          BlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoryScreen]
class CategoryRoute extends _i9.PageRouteInfo<void> {
  const CategoryRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PostUtmeBaseRoute]
class PostUtmeBaseRoute extends _i9.PageRouteInfo<void> {
  const PostUtmeBaseRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PostUtmeBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeBaseRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PreviewBlogScreen]
class PreviewBlogRoute extends _i9.PageRouteInfo<void> {
  const PreviewBlogRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PreviewBlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreviewBlogRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SelectCategoryScreen]
class SelectCategoryRoute extends _i9.PageRouteInfo<void> {
  const SelectCategoryRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SelectCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectCategoryRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.UploadBlogScreen]
class UploadBlogRoute extends _i9.PageRouteInfo<void> {
  const UploadBlogRoute({List<_i9.PageRouteInfo>? children})
      : super(
          UploadBlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'UploadBlogRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.UtmeBaseRoute]
class UtmeBaseRoute extends _i9.PageRouteInfo<void> {
  const UtmeBaseRoute({List<_i9.PageRouteInfo>? children})
      : super(
          UtmeBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'UtmeBaseRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
