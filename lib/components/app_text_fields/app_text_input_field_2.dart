import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solidsolutionweb/components/helper_class/number_input_formatter.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class AppTextInputField2 extends StatefulWidget {
  const AppTextInputField2({
    this.ispassword = false,
    this.fieldlabel,
    this.maxlines,
    this.textinputtype,
    this.maxlength,
    this.fieldcurve,
    this.bordercolor,
    this.isNameField = false,
    this.topmargin,
    this.verticalContent = 8,
    this.controller,
    this.onChanged,
    this.isEnabled,
    this.autofocus,
    this.labelText,
    this.labelTextStyle,
    this.isfilled = false,
    this.isNumberField = false,
    this.textCapitalization,
    this.isCardField = false,
    this.isDateField = false,
    Key? key,
    this.textInputAction,
    this.leftmargin,
    this.rightmargin,
  }) : super(key: key);
  final Function(String value)? onChanged;
  final bool ispassword;
  final bool? isEnabled;
  final bool isfilled;
  final String? fieldlabel;
  final TextInputType? textinputtype;
  final int? maxlines;
  final int? maxlength;
  final double? fieldcurve;
  final double? topmargin;
  final double? leftmargin;
  final double? rightmargin;
  final double verticalContent;
  final TextInputAction? textInputAction;
  final Color? bordercolor;
  final bool? autofocus;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final bool isNameField;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final bool isNumberField;
  final bool isCardField;
  final bool isDateField;
  @override
  State<AppTextInputField2> createState() => _AppTextInputField2State();
}

class _AppTextInputField2State extends State<AppTextInputField2> {
  bool showpassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: widget.topmargin ?? 20,
        left: widget.leftmargin ?? 15,
        right: widget.rightmargin ?? 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelText == null
              ? const SizedBox()
              : Text(
                  widget.labelText ?? "",
                  style: widget.labelTextStyle ??
                      const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.dartArsh,
                      ),
                ),
          const SizedBox(height: 10),
          TextField(
            autofocus: widget.autofocus ?? false,
            enabled: widget.isEnabled,
            maxLines: widget.maxlines ?? 1,
            maxLength: widget.maxlength,
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            onChanged: widget.onChanged ?? (value) {},
            obscureText: widget.ispassword ? showpassword : false,
            keyboardType: widget.textinputtype ?? TextInputType.text,
            // maxLengthEnforcement: MaxLengthEnforcement.enforced,
            buildCounter: (
              context, {
              currentLength = 3,
              isFocused = true,
              maxLength,
            }) {
              return Container();
            },
            inputFormatters: (widget.isNameField)
                ? [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))]
                : widget.isNumberField
                    ? [NumberInputFormatter()]
                    : widget.isCardField
                        ? [CardNumberFormatter()]
                        : widget.isDateField
                            ? [CardDateFormatter()]
                            : [],
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.sentences,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.3,
                  color: widget.bordercolor ?? AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(widget.fieldcurve ?? 10),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: widget.verticalContent,
              ),
              suffix: widget.ispassword
                  ? IconButton(
                      padding: const EdgeInsets.only(top: 4),
                      constraints: const BoxConstraints(),
                      iconSize: 17,
                      onPressed: () {
                        setState(() {
                          showpassword = !showpassword;
                        });
                      },
                      icon: Icon(
                        showpassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primaryColor.withOpacity(0.3),
                      ),
                    )
                  : const SizedBox(),
              hintText: widget.fieldlabel ?? '',
              filled: widget.isfilled,
            ),
          ),
        ],
      ),
    );
  }
}
