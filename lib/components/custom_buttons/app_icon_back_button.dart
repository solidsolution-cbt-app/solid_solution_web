import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class AppIconBackButton extends StatelessWidget {
  const AppIconBackButton({
    this.backFunction,
    this.icon,
    this.iconSize,
    this.iconColor,
    super.key,
  });
  final Function()? backFunction;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: backFunction ??
            () {
              Navigator.pop(context);
            },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.primaryColor,
              ),
            ),
            child: Icon(
              icon ?? Icons.chevron_left,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
