// ignore_for_file: must_be_immutable

//import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:chat_phi/core/app_colors.dart';
import 'package:chat_phi/core/text_styles.dart';
import 'package:chat_phi/widgets/app_text.dart';
import 'package:chat_phi/widgets/image_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditFormOutlinedField extends StatefulWidget {
  EditFormOutlinedField({
    this.label = '',
    this.hint = '',
    this.prefixIcon,
    this.suffixIcon,
    this.suffixWidget,
    this.prefixWidget,
    this.onSaved,
    this.onSubmit,
    this.onChanged,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.controller,
    this.onPasswordToggle,
    this.onTapInfo,
    this.initialValue,
    this.autoValidate = false,
    this.autocorrect = true,
    this.readOnly = false,
    this.ignore = false,
    this.obscureText = false,
    this.isborderDecoration = true,
    this.onTapped,
    this.keyboardType,
    this.isPassword = false,
    this.isRequired = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.otherText,
    this.maxLength,
    this.inputFormatters,
    this.focusedColorBorder = Colors.white,
    this.labelStyle,
    this.hintStyle,
    this.textStyle,
    this.decoration,
    this.iconColor,
    this.fillColor,
    this.textCapitalization = TextCapitalization.none,
    this.key,
    this.showInfo = false,
    this.otherTextColor,
    this.focusNode,
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
    this.horizontalPadding,
    this.verticalPadding,
  });

  TextCapitalization textCapitalization;
  String label;
  String hint;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Color? iconColor;
  final String? otherText;
  Widget? prefixWidget;
  Widget? suffixWidget;

  final FormFieldSetter<String>? onSaved;
  final FormFieldSetter<String>? onSubmit;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  VoidCallback? onPasswordToggle;
  final AutovalidateMode? autoValidateMode;

  String? initialValue;
  TextEditingController? controller;
  FocusNode? focusNode;
  final Color? fillColor;
  bool autocorrect;
  bool autoValidate;
  bool readOnly;
  bool showInfo;
  bool ignore;
  bool obscureText;
  bool isborderDecoration;
  bool isPassword;
  bool isRequired;
  final Color? otherTextColor;
  // bool clickable;
  Function()? onTapped;

  // bool clickable;
  Function()? onTapInfo;

  TextInputType? keyboardType;
  int maxLines;
  int minLines;
  int? maxLength;
  var inputFormatters;
  final double? horizontalPadding;
  final double? verticalPadding;

  Color focusedColorBorder;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  InputDecoration? decoration;
  FloatingLabelBehavior floatingLabelBehavior;
  Key? key;

  @override
  State<EditFormOutlinedField> createState() => _EditFormOutlinedFieldState();
}

class _EditFormOutlinedFieldState extends State<EditFormOutlinedField> {
  bool obscureText = true;
  void showPassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapped,
      child: IgnorePointer(
        ignoring: widget.ignore,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextFormField(
                key: widget.key,
                keyboardType: widget.keyboardType,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                focusNode: widget.focusNode,
                //enabled: enabled,
                readOnly: widget.readOnly,
                textCapitalization: widget.textCapitalization,
                // autovalidate: autoValidate ?? false,
                onSaved: widget.onSaved,
                obscuringCharacter: "*",
                onFieldSubmitted: widget.onSubmit,
                validator: widget.validator,
                autocorrect: widget.autocorrect,
                initialValue: widget.initialValue,
                obscureText: widget.isPassword ? obscureText : false,
                onChanged: widget.onChanged,
                style: widget.textStyle ?? bodyLarge,
                onTap: widget.onTapped,
                controller: widget.controller,
                autovalidateMode: widget.autoValidateMode,
                inputFormatters: widget.inputFormatters ??
                    [
                      LengthLimitingTextInputFormatter(widget.maxLength ?? 100),
                    ],
                decoration: widget.decoration ??
                    InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: widget.verticalPadding ?? 12.5.h,
                          horizontal: widget.horizontalPadding ?? 12.w),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Pallet.blue, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      filled: true,
                      fillColor: widget.fillColor ?? Pallet.greyLight,
                      //contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24.0),
                      hintText: widget.hint,
                      hintStyle: widget.hintStyle ?? bodyLarge,

                      isDense: true,

                      prefixIcon: widget.prefixWidget,
                      suffixIconConstraints: BoxConstraints(minHeight: 1),
                      prefixIconConstraints: BoxConstraints(minHeight: 1),
                      //prefix: widget.prefixWidget,
                      suffixIcon: widget.suffixWidget,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
