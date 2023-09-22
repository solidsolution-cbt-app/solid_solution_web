import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.onTap,
    required this.iconPath,
    this.scale = 0.5,
    super.key,
  });

  final Function() onTap;
  final String iconPath;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Transform.scale(
          scale: scale,
          child: SvgPicture.asset(
            iconPath,
            width: 15,
            height: 15,
          ),
        ),
      ),
    );
  }
}
