import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/constants/constants.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({super.key, this.showLoader = false});
  final bool showLoader;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showLoader,
      child: Container(
        width: AppConstants.screenWidth(),
        height: AppConstants.screenHeight(),
        color: AppColors.primaryColor.withOpacity(0.3),
        child: const Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              backgroundColor: AppColors.violet,
            ),
          ),
        ),
      ),
    );
  }
}
