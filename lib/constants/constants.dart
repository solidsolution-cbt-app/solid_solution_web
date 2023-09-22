import 'package:flutter/material.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/core/navigation_service.dart';

class AppConstants {
  static double screenHeight() {
    return MediaQuery.of(
            locatorX<NavigationService>().navigatorKey.currentContext!)
        .size
        .height;
  }

  static double screenWidth() {
    return MediaQuery.of(
            locatorX<NavigationService>().navigatorKey.currentContext!)
        .size
        .width;
  }
}
