// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:solidsolutionweb/features/authentication/views/category_screen.dart'
    as _i3;
import 'package:solidsolutionweb/features/authentication/views/login_screen.dart'
    as _i4;
import 'package:solidsolutionweb/features/authentication/views/select_category_route.dart'
    as _i13;
import 'package:solidsolutionweb/features/blog/model/blog_model.dart' as _i18;
import 'package:solidsolutionweb/features/blog/views/blog_base_screen.dart'
    as _i1;
import 'package:solidsolutionweb/features/blog/views/pages/blog_screen.dart'
    as _i2;
import 'package:solidsolutionweb/features/blog/views/pages/preview_blog_screen.dart'
    as _i12;
import 'package:solidsolutionweb/features/blog/views/pages/upload_blog_screen.dart'
    as _i14;
import 'package:solidsolutionweb/features/post_utme/views/pages/post_utme_add_question_screen.dart'
    as _i5;
import 'package:solidsolutionweb/features/post_utme/views/pages/post_utme_edit_question_screen.dart'
    as _i8;
import 'package:solidsolutionweb/features/post_utme/views/pages/post_utme_question_list.dart'
    as _i9;
import 'package:solidsolutionweb/features/post_utme/views/pages/post_utme_question_view_screen.dart'
    as _i10;
import 'package:solidsolutionweb/features/post_utme/views/post_utme_base_route.dart'
    as _i6;
import 'package:solidsolutionweb/features/post_utme/views/post_utme_dashboard.dart'
    as _i7;
import 'package:solidsolutionweb/features/post_utme/views/post_utme_route_screen.dart'
    as _i11;
import 'package:solidsolutionweb/features/utme/views/utme_base_route.dart'
    as _i15;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    BlogBaseRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BlogBaseScreen(),
      );
    },
    BlogRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BlogScreen(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CategoryScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    PostUtmeAddQuestionRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PostUtmeAddQuestionScreen(),
      );
    },
    PostUtmeBaseRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PostUtmeBaseRoute(),
      );
    },
    PostUtmeDashboard.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PostUtmeDashboard(),
      );
    },
    PostUtmeEditQuestionRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PostUtmeEditQuestionScreen(),
      );
    },
    PostUtmeQuestionList.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PostUtmeQuestionList(),
      );
    },
    PostUtmeQuestionViewRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PostUtmeQuestionViewScreen(),
      );
    },
    PostUtmeRouterRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostUtmeRouterRouteArgs>(
          orElse: () =>
              PostUtmeRouterRouteArgs(school: pathParams.getString('school')));
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.PostUtmeRouterScreen(
          school: args.school,
          key: args.key,
        ),
      );
    },
    PreviewBlogRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewBlogRouteArgs>(
          orElse: () => const PreviewBlogRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.PreviewBlogScreen(
          blog: args.blog,
          key: args.key,
        ),
      );
    },
    SelectCategoryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SelectCategoryScreen(),
      );
    },
    UploadBlogRoute.name: (routeData) {
      final args = routeData.argsAs<UploadBlogRouteArgs>(
          orElse: () => const UploadBlogRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.UploadBlogScreen(
          blog: args.blog,
          key: args.key,
        ),
      );
    },
    UtmeBaseRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.UtmeBaseRoute(),
      );
    },
  };
}

/// generated route for
/// [_i1.BlogBaseScreen]
class BlogBaseRoute extends _i16.PageRouteInfo<void> {
  const BlogBaseRoute({List<_i16.PageRouteInfo>? children})
      : super(
          BlogBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogBaseRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BlogScreen]
class BlogRoute extends _i16.PageRouteInfo<void> {
  const BlogRoute({List<_i16.PageRouteInfo>? children})
      : super(
          BlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CategoryScreen]
class CategoryRoute extends _i16.PageRouteInfo<void> {
  const CategoryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PostUtmeAddQuestionScreen]
class PostUtmeAddQuestionRoute extends _i16.PageRouteInfo<void> {
  const PostUtmeAddQuestionRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PostUtmeAddQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeAddQuestionRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PostUtmeBaseRoute]
class PostUtmeBaseRoute extends _i16.PageRouteInfo<void> {
  const PostUtmeBaseRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PostUtmeBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeBaseRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PostUtmeDashboard]
class PostUtmeDashboard extends _i16.PageRouteInfo<void> {
  const PostUtmeDashboard({List<_i16.PageRouteInfo>? children})
      : super(
          PostUtmeDashboard.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeDashboard';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PostUtmeEditQuestionScreen]
class PostUtmeEditQuestionRoute extends _i16.PageRouteInfo<void> {
  const PostUtmeEditQuestionRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PostUtmeEditQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeEditQuestionRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PostUtmeQuestionList]
class PostUtmeQuestionList extends _i16.PageRouteInfo<void> {
  const PostUtmeQuestionList({List<_i16.PageRouteInfo>? children})
      : super(
          PostUtmeQuestionList.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeQuestionList';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PostUtmeQuestionViewScreen]
class PostUtmeQuestionViewRoute extends _i16.PageRouteInfo<void> {
  const PostUtmeQuestionViewRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PostUtmeQuestionViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeQuestionViewRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PostUtmeRouterScreen]
class PostUtmeRouterRoute extends _i16.PageRouteInfo<PostUtmeRouterRouteArgs> {
  PostUtmeRouterRoute({
    required String school,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          PostUtmeRouterRoute.name,
          args: PostUtmeRouterRouteArgs(
            school: school,
            key: key,
          ),
          rawPathParams: {'school': school},
          initialChildren: children,
        );

  static const String name = 'PostUtmeRouterRoute';

  static const _i16.PageInfo<PostUtmeRouterRouteArgs> page =
      _i16.PageInfo<PostUtmeRouterRouteArgs>(name);
}

class PostUtmeRouterRouteArgs {
  const PostUtmeRouterRouteArgs({
    required this.school,
    this.key,
  });

  final String school;

  final _i17.Key? key;

  @override
  String toString() {
    return 'PostUtmeRouterRouteArgs{school: $school, key: $key}';
  }
}

/// generated route for
/// [_i12.PreviewBlogScreen]
class PreviewBlogRoute extends _i16.PageRouteInfo<PreviewBlogRouteArgs> {
  PreviewBlogRoute({
    _i18.BlogModel? blog,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          PreviewBlogRoute.name,
          args: PreviewBlogRouteArgs(
            blog: blog,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PreviewBlogRoute';

  static const _i16.PageInfo<PreviewBlogRouteArgs> page =
      _i16.PageInfo<PreviewBlogRouteArgs>(name);
}

class PreviewBlogRouteArgs {
  const PreviewBlogRouteArgs({
    this.blog,
    this.key,
  });

  final _i18.BlogModel? blog;

  final _i17.Key? key;

  @override
  String toString() {
    return 'PreviewBlogRouteArgs{blog: $blog, key: $key}';
  }
}

/// generated route for
/// [_i13.SelectCategoryScreen]
class SelectCategoryRoute extends _i16.PageRouteInfo<void> {
  const SelectCategoryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SelectCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectCategoryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.UploadBlogScreen]
class UploadBlogRoute extends _i16.PageRouteInfo<UploadBlogRouteArgs> {
  UploadBlogRoute({
    _i18.BlogModel? blog,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          UploadBlogRoute.name,
          args: UploadBlogRouteArgs(
            blog: blog,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UploadBlogRoute';

  static const _i16.PageInfo<UploadBlogRouteArgs> page =
      _i16.PageInfo<UploadBlogRouteArgs>(name);
}

class UploadBlogRouteArgs {
  const UploadBlogRouteArgs({
    this.blog,
    this.key,
  });

  final _i18.BlogModel? blog;

  final _i17.Key? key;

  @override
  String toString() {
    return 'UploadBlogRouteArgs{blog: $blog, key: $key}';
  }
}

/// generated route for
/// [_i15.UtmeBaseRoute]
class UtmeBaseRoute extends _i16.PageRouteInfo<void> {
  const UtmeBaseRoute({List<_i16.PageRouteInfo>? children})
      : super(
          UtmeBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'UtmeBaseRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
