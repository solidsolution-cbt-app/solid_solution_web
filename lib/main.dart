import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logman/logman.dart';
import 'package:solidsolutionweb/constants/app_strings.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/local_data_base.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/core/route_service/route.dart';
import 'package:toastification/toastification.dart';

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
      child: ToastificationWrapper(
        child: MaterialApp.router(
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
          routerConfig: AppRouter().config(
            deepLinkBuilder: (deepLink) {
              return deepLink;
            },
            navigatorObservers: () => [
              LogmanNavigatorObserver(),
            ],
          ),
        ),
      ),
    );
  }
}
