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
          path: "/category",
          page: CategoryRoute.page,
        ),
        //Jamb Dashboard Route
        // CustomRoute(
        //   page: AuthenticationBaseRoute.page,
        //   initial: true,
        //   path: '/auth-screen',
        //   transitionsBuilder: (_, animation, ___, child) => FadeTransition(
        //     opacity: animation,
        //     child: child,
        //   ),
        //   children: [
        //     AutoRoute(
        //       path: "signup_screen",
        //       page: SignUpRoute.page,
        //     ),
        //     AutoRoute(
        //       path: "login_screen",
        //       page: LoginRoute.page,
        //     ),
        //     AutoRoute(
        //       path: "otpverification_screen",
        //       page: OtpVerificationRoute.page,
        //     ),
        //     AutoRoute(
        //       path: "changepassword_screen",
        //       page: ChangePasswordRoute.page,
        //     ),
        //     AutoRoute(
        //       path: "forgotpassword_screen",
        //       page: ForgotPasswordRoute.page,
        //     ),
        //   ],
        // ),
        // // MainAppRoute Route
      ];
}
