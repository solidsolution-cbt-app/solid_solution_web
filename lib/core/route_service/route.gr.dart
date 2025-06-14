// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:solidsolutionweb/features/authentication/views/category_screen.dart'
    as _i4;
import 'package:solidsolutionweb/features/authentication/views/login_screen.dart'
    as _i10;
import 'package:solidsolutionweb/features/authentication/views/select_category_route.dart'
    as _i19;
import 'package:solidsolutionweb/features/blog/model/blog_model.dart' as _i24;
import 'package:solidsolutionweb/features/blog/views/blog_base_screen.dart'
    as _i2;
import 'package:solidsolutionweb/features/blog/views/pages/blog_screen.dart'
    as _i3;
import 'package:solidsolutionweb/features/blog/views/pages/preview_blog_screen.dart'
    as _i18;
import 'package:solidsolutionweb/features/blog/views/pages/upload_blog_screen.dart'
    as _i20;
import 'package:solidsolutionweb/features/post_utme/views/pages/post_utme_add_question_screen.dart'
    as _i11;
import 'package:solidsolutionweb/features/post_utme/views/pages/post_utme_edit_question_screen.dart'
    as _i14;
import 'package:solidsolutionweb/features/post_utme/views/pages/post_utme_list_screen.dart'
    as _i15;
import 'package:solidsolutionweb/features/post_utme/views/pages/post_utme_question_display_screen.dart'
    as _i16;
import 'package:solidsolutionweb/features/post_utme/views/pages/post_utme_questions_screen.dart'
    as _i17;
import 'package:solidsolutionweb/features/post_utme/views/post_utme_base_route.dart'
    as _i12;
import 'package:solidsolutionweb/features/post_utme/views/post_utme_dashboard.dart'
    as _i13;
import 'package:solidsolutionweb/features/utme/pages/exam/views/add_exam_question_screen.dart'
    as _i1;
import 'package:solidsolutionweb/features/utme/pages/exam/views/display_exam_question_screen.dart'
    as _i5;
import 'package:solidsolutionweb/features/utme/pages/exam/views/edit_exam_question_screen.dart'
    as _i6;
import 'package:solidsolutionweb/features/utme/pages/exam/views/exam_dash_board.dart'
    as _i7;
import 'package:solidsolutionweb/features/utme/pages/exam/views/exam_list_screen.dart'
    as _i8;
import 'package:solidsolutionweb/features/utme/pages/exam/views/exam_question_screen.dart'
    as _i9;
import 'package:solidsolutionweb/features/utme/views/utme_base_route.dart'
    as _i21;

abstract class $AppRouter extends _i22.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    AddExamQuestionRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddExamQuestionScreen(),
      );
    },
    BlogBaseRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BlogBaseScreen(),
      );
    },
    BlogRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BlogScreen(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CategoryScreen(),
      );
    },
    DisplayExamQuestionRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DisplayExamQuestionScreen(),
      );
    },
    EditExamQuestionRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EditExamQuestionScreen(),
      );
    },
    ExamDashBoard.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ExamDashBoard(),
      );
    },
    ExamListRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ExamListScreen(),
      );
    },
    ExamQuestionRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ExamQuestionScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginScreen(),
      );
    },
    PostUtmeAddQuestionRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PostUtmeAddQuestionScreen(),
      );
    },
    PostUtmeBaseRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PostUtmeBaseRoute(),
      );
    },
    PostUtmeDashBoard.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostUtmeDashBoardArgs>(
          orElse: () =>
              PostUtmeDashBoardArgs(school: pathParams.getString('school')));
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.PostUtmeDashBoard(
          school: args.school,
          key: args.key,
        ),
      );
    },
    PostUtmeEditQuestionRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PostUtmeEditQuestionScreen(),
      );
    },
    PostUtmeListRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PostUtmeListScreen(),
      );
    },
    PostUtmeQuestionDisplayRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PostUtmeQuestionDisplayScreen(),
      );
    },
    PostUtmeQuestionsRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PostUtmeQuestionsScreen(),
      );
    },
    PreviewBlogRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewBlogRouteArgs>(
          orElse: () => const PreviewBlogRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.PreviewBlogScreen(
          blog: args.blog,
          key: args.key,
        ),
      );
    },
    SelectCategoryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SelectCategoryScreen(),
      );
    },
    UploadBlogRoute.name: (routeData) {
      final args = routeData.argsAs<UploadBlogRouteArgs>(
          orElse: () => const UploadBlogRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.UploadBlogScreen(
          blog: args.blog,
          key: args.key,
        ),
      );
    },
    UtmeBaseRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.UtmeBaseRoute(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddExamQuestionScreen]
class AddExamQuestionRoute extends _i22.PageRouteInfo<void> {
  const AddExamQuestionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          AddExamQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddExamQuestionRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BlogBaseScreen]
class BlogBaseRoute extends _i22.PageRouteInfo<void> {
  const BlogBaseRoute({List<_i22.PageRouteInfo>? children})
      : super(
          BlogBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogBaseRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BlogScreen]
class BlogRoute extends _i22.PageRouteInfo<void> {
  const BlogRoute({List<_i22.PageRouteInfo>? children})
      : super(
          BlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CategoryScreen]
class CategoryRoute extends _i22.PageRouteInfo<void> {
  const CategoryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DisplayExamQuestionScreen]
class DisplayExamQuestionRoute extends _i22.PageRouteInfo<void> {
  const DisplayExamQuestionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          DisplayExamQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'DisplayExamQuestionRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EditExamQuestionScreen]
class EditExamQuestionRoute extends _i22.PageRouteInfo<void> {
  const EditExamQuestionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          EditExamQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditExamQuestionRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ExamDashBoard]
class ExamDashBoard extends _i22.PageRouteInfo<void> {
  const ExamDashBoard({List<_i22.PageRouteInfo>? children})
      : super(
          ExamDashBoard.name,
          initialChildren: children,
        );

  static const String name = 'ExamDashBoard';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ExamListScreen]
class ExamListRoute extends _i22.PageRouteInfo<void> {
  const ExamListRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ExamListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamListRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ExamQuestionScreen]
class ExamQuestionRoute extends _i22.PageRouteInfo<void> {
  const ExamQuestionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ExamQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamQuestionRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PostUtmeAddQuestionScreen]
class PostUtmeAddQuestionRoute extends _i22.PageRouteInfo<void> {
  const PostUtmeAddQuestionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PostUtmeAddQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeAddQuestionRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PostUtmeBaseRoute]
class PostUtmeBaseRoute extends _i22.PageRouteInfo<void> {
  const PostUtmeBaseRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PostUtmeBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeBaseRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PostUtmeDashBoard]
class PostUtmeDashBoard extends _i22.PageRouteInfo<PostUtmeDashBoardArgs> {
  PostUtmeDashBoard({
    required String school,
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          PostUtmeDashBoard.name,
          args: PostUtmeDashBoardArgs(
            school: school,
            key: key,
          ),
          rawPathParams: {'school': school},
          initialChildren: children,
        );

  static const String name = 'PostUtmeDashBoard';

  static const _i22.PageInfo<PostUtmeDashBoardArgs> page =
      _i22.PageInfo<PostUtmeDashBoardArgs>(name);
}

class PostUtmeDashBoardArgs {
  const PostUtmeDashBoardArgs({
    required this.school,
    this.key,
  });

  final String school;

  final _i23.Key? key;

  @override
  String toString() {
    return 'PostUtmeDashBoardArgs{school: $school, key: $key}';
  }
}

/// generated route for
/// [_i14.PostUtmeEditQuestionScreen]
class PostUtmeEditQuestionRoute extends _i22.PageRouteInfo<void> {
  const PostUtmeEditQuestionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PostUtmeEditQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeEditQuestionRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PostUtmeListScreen]
class PostUtmeListRoute extends _i22.PageRouteInfo<void> {
  const PostUtmeListRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PostUtmeListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeListRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PostUtmeQuestionDisplayScreen]
class PostUtmeQuestionDisplayRoute extends _i22.PageRouteInfo<void> {
  const PostUtmeQuestionDisplayRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PostUtmeQuestionDisplayRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeQuestionDisplayRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i17.PostUtmeQuestionsScreen]
class PostUtmeQuestionsRoute extends _i22.PageRouteInfo<void> {
  const PostUtmeQuestionsRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PostUtmeQuestionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostUtmeQuestionsRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PreviewBlogScreen]
class PreviewBlogRoute extends _i22.PageRouteInfo<PreviewBlogRouteArgs> {
  PreviewBlogRoute({
    _i24.BlogModel? blog,
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          PreviewBlogRoute.name,
          args: PreviewBlogRouteArgs(
            blog: blog,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PreviewBlogRoute';

  static const _i22.PageInfo<PreviewBlogRouteArgs> page =
      _i22.PageInfo<PreviewBlogRouteArgs>(name);
}

class PreviewBlogRouteArgs {
  const PreviewBlogRouteArgs({
    this.blog,
    this.key,
  });

  final _i24.BlogModel? blog;

  final _i23.Key? key;

  @override
  String toString() {
    return 'PreviewBlogRouteArgs{blog: $blog, key: $key}';
  }
}

/// generated route for
/// [_i19.SelectCategoryScreen]
class SelectCategoryRoute extends _i22.PageRouteInfo<void> {
  const SelectCategoryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SelectCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectCategoryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i20.UploadBlogScreen]
class UploadBlogRoute extends _i22.PageRouteInfo<UploadBlogRouteArgs> {
  UploadBlogRoute({
    _i24.BlogModel? blog,
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          UploadBlogRoute.name,
          args: UploadBlogRouteArgs(
            blog: blog,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UploadBlogRoute';

  static const _i22.PageInfo<UploadBlogRouteArgs> page =
      _i22.PageInfo<UploadBlogRouteArgs>(name);
}

class UploadBlogRouteArgs {
  const UploadBlogRouteArgs({
    this.blog,
    this.key,
  });

  final _i24.BlogModel? blog;

  final _i23.Key? key;

  @override
  String toString() {
    return 'UploadBlogRouteArgs{blog: $blog, key: $key}';
  }
}

/// generated route for
/// [_i21.UtmeBaseRoute]
class UtmeBaseRoute extends _i22.PageRouteInfo<void> {
  const UtmeBaseRoute({List<_i22.PageRouteInfo>? children})
      : super(
          UtmeBaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'UtmeBaseRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}
