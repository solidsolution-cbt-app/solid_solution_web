import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    required this.toggleChecked,
    required this.isChecked,
    Key? key,
  }) : super(key: key);
  final Function(bool value) toggleChecked;
  final bool isChecked;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool allowTermsofService = false;
  @override
  void initState() {
    super.initState();
    allowTermsofService = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          allowTermsofService = !allowTermsofService;
        });
        widget.toggleChecked(allowTermsofService);
      },
      icon: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
          color: allowTermsofService ? AppColors.primaryColor : Colors.white,
        ),
        child: Visibility(
          visible: allowTermsofService,
          child: const Center(
            child: Icon(
              Icons.done,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
