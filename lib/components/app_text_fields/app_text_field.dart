import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/constants/styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    this.controller,
    this.fieldLabel,
    this.hintText,
    this.maxLength,
    this.maxLines,
    this.buttonWidth = 500,
    this.onChanged,
    this.prefixIconPath = "",
    this.isPassword = false,
    super.key,
  });

  final double buttonWidth;
  final TextEditingController? controller;
  final String? fieldLabel;
  final String? hintText;

  final Function(String value)? onChanged;

  final int? maxLines;
  final int? maxLength;

  final bool isPassword;
  final String prefixIconPath;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showpassword = false;
  toggleShowPassword() {
    showpassword = !showpassword;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.buttonWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.fieldLabel != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                widget.fieldLabel ?? "",
                style: AppTextStyles.labelMedium,
              ),
            ),
          ),
          TextField(
            controller: widget.controller,
            maxLength: widget.maxLength,
            obscureText: showpassword,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  child: SizedBox(
                    width: 5,
                    child: SvgPicture.asset(
                      widget.prefixIconPath,
                    ),
                  ),
                ),
              ),
              suffix: widget.isPassword
                  ? IconButton(
                      padding:
                          const EdgeInsets.only(top: 1.3, right: 12, left: 12),
                      constraints: const BoxConstraints(),
                      iconSize: 20,
                      onPressed: () {
                        toggleShowPassword();
                      },
                      icon: Icon(
                        showpassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.dartArsh,
                      ),
                    )
                  : const SizedBox(),
              hintText: widget.hintText ?? '',
              hintStyle: AppTextStyles.labelMedium.copyWith(
                color: AppColors.dartArsh,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.dartArsh,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppTextField2 extends StatelessWidget {
  const AppTextField2({
    this.controller,
    this.fieldLabel,
    this.hintText,
    this.maxLength,
    this.maxLines,
    this.buttonWidth = 500,
    this.onChanged,
    super.key,
  });

  final double buttonWidth;
  final TextEditingController? controller;
  final String? fieldLabel;
  final String? hintText;

  final Function(String value)? onChanged;

  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: fieldLabel != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                fieldLabel ?? "",
                style: AppTextStyles.labelMedium,
              ),
            ),
          ),
          TextField(
            autofocus: true,
            controller: controller,
            maxLength: maxLength,
            onChanged: onChanged,
            maxLines: maxLines,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              hintText: hintText ?? '',
              hintStyle: AppTextStyles.labelMedium.copyWith(
                color: AppColors.dartArsh,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.dartArsh,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
