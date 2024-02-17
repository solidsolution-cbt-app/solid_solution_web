import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solidsolutionweb/constants/app_strings.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/local_data_base.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/core/navigation_service.dart';
import 'package:solidsolutionweb/core/routes.dart';
import 'package:solidsolutionweb/features/authentication/views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  setUpLocatorX();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (oversroll) {
        oversroll.disallowIndicator();
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.companyName,
        theme: ThemeData(
          canvasColor: Colors.transparent,
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColors.dartArsh.withOpacity(0.5)),
            color: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
          ),
        ),
        navigatorKey: locatorX<NavigationService>().navigatorKey,
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const LoginScreen(),
      ),
    );
  }
}
