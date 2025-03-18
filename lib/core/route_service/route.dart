import 'package:auto_route/auto_route.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //SplashScreen
        AutoRoute(
          path: "/",
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: "/select-category",
          page: SelectCategoryRoute.page,
          children: [
            AutoRoute(
              initial: true,
              path: "category",
              page: CategoryRoute.page,
            ),
            AutoRoute(
              path: "utme-screen",
              page: UtmeBaseRoute.page,
            ),
            AutoRoute(
              path: "postutme-screen",
              page: PostUtmeBaseRoute.page,
            ),
            AutoRoute(
              page: BlogBaseRoute.page,
              path: "blog-base-screen",
              children: [
                AutoRoute(
                  path: "blog-screen",
                  initial: true,
                  page: BlogRoute.page,
                ),
                AutoRoute(
                  path: "preview-blog-screen",
                  page: PreviewBlogRoute.page,
                ),
                AutoRoute(
                  path: "upload-blog-screen",
                  page: UploadBlogRoute.page,
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          path: "/post-utme/:school",
          page: PostUtmeRouterRoute.page,
          children: [
            AutoRoute(
              page: PostUtmeDashboard.page,
              path: "dashboard",
              children: [
                AutoRoute(
                  initial: true,
                  path: "question-list",
                  page: PostUtmeQuestionList.page,
                ),
                AutoRoute(
                  path: "add-question",
                  page: PostUtmeAddQuestionRoute.page,
                ),
                AutoRoute(
                  path: "edit-question",
                  page: PostUtmeEditQuestionRoute.page,
                ),
                AutoRoute(
                  path: "question-view",
                  page: PostUtmeQuestionViewRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}
