import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class YearFilter extends StatefulWidget {
  const YearFilter({
    required this.onChangeyear,
    required this.selectedYear,
    this.rightPosition,
    this.positionFromLeft,
    super.key,
  });
  final Function(String year) onChangeyear;
  final String selectedYear;
  final double? positionFromLeft;
  final double? rightPosition;
  @override
  State<YearFilter> createState() => _YearFilterState();
}

class _YearFilterState extends State<YearFilter> {
  String currentYear = "all";
  changeYear(String year) {
    currentYear = year;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    currentYear = widget.selectedYear;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          showYearDropDown(
            righttPosition: widget.rightPosition ?? 50,
            leftPosition: widget.positionFromLeft ??
                MediaQuery.of(context).size.width - 100,
            context: context,
            years: getYear(),
            onSelectYear: (value) {
              widget.onChangeyear(value);
              changeYear(value);
            },
          );
        },
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextBody1(text: currentYear),
              const SizedBox(width: 20),
              const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 25,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> getYear() {
  List<String> years = ["all"];
  int currentYear = DateTime.now().year;
  int startYear = currentYear - 10;
  for (int i = startYear; i <= currentYear; i++) {
    years.add(i.toString());
  }
  return years;
}

Future<void> showYearDropDown({
  required BuildContext context,
  required List<String> years,
  required Function(String language) onSelectYear,
  required final double leftPosition,
  required final double righttPosition,
}) async {
  final result = await showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(
      leftPosition,
      120,
      righttPosition,
      0,
    ), // Size of the button
    // Offset.zero & overlay.size,

    items: years.map((String year) {
      return PopupMenuItem<String>(
        value: year,
        child: CustomTextBody1(
          text: year,
        ),
      );
    }).toList(),
  );

  if (result != null) {
    onSelectYear(result);
    // print(result);
  }
}
