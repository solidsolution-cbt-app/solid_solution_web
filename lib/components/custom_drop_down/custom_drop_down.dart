import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/constants/styles.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.title,
    this.width,
    this.onSelected,
    this.initialValue,
    required this.dropdownMenuEntries,
    this.isRequired = false,
    this.maxHeight,
  });
  final bool isRequired;
  final String title;
  final double? width;
  final double? maxHeight;
  final String? initialValue;

  final Function(dynamic)? onSelected;
  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    final hintStyle = AppTextStyles.labelMedium.copyWith(
      color: AppColors.dartArsh,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            widget.title,
            style: AppTextStyles.labelMedium,
          ),
        ),
        Container(
          color: Colors.white,
          child: DropdownMenu(
            width: widget.width,
            menuHeight: widget.maxHeight,
            hintText: widget.initialValue ?? 'Select',
            onSelected: widget.onSelected,
            requestFocusOnTap: true,
            enableSearch: true,
            enableFilter: true,
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: hintStyle,
              constraints: const BoxConstraints(
                maxHeight: 50,
              ),
              focusColor: AppColors.primaryColor,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.dartArsh,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            dropdownMenuEntries: widget.dropdownMenuEntries,
          ),
        ),
      ],
    );
  }
}
