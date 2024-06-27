import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotdirt/app/util/theme.dart';

class MyTextformField extends StatelessWidget {
  final TextEditingController? textController;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLength;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;
  final dynamic onChanged;
  final bool? readOnly;
  final dynamic onTap;
  final dynamic contentPadding;
  final dynamic border;
  final TextCapitalization? textCapitalization;
  final dynamic inputFormatters;
  final dynamic counter;

  const MyTextformField({
    super.key,
    this.textController,
    this.obscureText,
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.maxLength,
    this.validator,
    this.maxLines,
    this.onChanged,
    this.readOnly,
    this.onTap,
    this.contentPadding,
    this.border,
    this.textCapitalization,
    this.inputFormatters,
    this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textInputAction: TextInputAction.next,
      enableInteractiveSelection: true,
      obscureText: obscureText == null ? false : obscureText!,
      maxLength: maxLength,
      maxLines: obscureText != null || maxLines == null ? 1 : maxLines,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      onTap: onTap,
      scrollPadding: EdgeInsets.zero,
      style: TextStyle(
        color: ThemeProvider.blackColor,
        fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
      ),
      cursorColor: ThemeProvider.appColor,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        counter: counter ?? const Offstage(),
        hintStyle: TextStyle(
          color: ThemeProvider.greyColor,
          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        ),
        filled: false,
        fillColor: readOnly == true
            ? ThemeProvider.greyColor
            : ThemeProvider.whiteColor,
        border: border ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: readOnly == true
                    ? ThemeProvider.whiteColor
                    : ThemeProvider.greyColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
        enabledBorder: border ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: readOnly == true
                    ? ThemeProvider.whiteColor
                    : ThemeProvider.greyColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        isDense: true,
        focusedBorder: border ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: readOnly == true
                    ? ThemeProvider.whiteColor
                    : ThemeProvider.greyColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
      ),
    );
  }
}

class MyTextformField2 extends StatelessWidget {
  final TextEditingController? textController;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLength;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;
  final dynamic onChanged;
  final bool? readOnly;
  final dynamic onTap;
  final TextCapitalization? textCapitalization;
  final dynamic inputFormatters;
  final dynamic counter;

  const MyTextformField2({
    super.key,
    this.textController,
    this.obscureText,
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.maxLength,
    this.validator,
    this.maxLines,
    this.onChanged,
    this.readOnly,
    this.onTap,
    this.textCapitalization,
    this.inputFormatters,
    this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textInputAction: TextInputAction.next,
      enableInteractiveSelection: true,
      obscureText: obscureText == null ? false : obscureText!,
      maxLength: maxLength,
      maxLines: obscureText != null || maxLines == null ? 1 : maxLines,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      onTap: onTap,
      style: TextStyle(
        color: ThemeProvider.blackColor,
        fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
      ),
      cursorColor: ThemeProvider.appColor,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        counter: counter ?? const Offstage(),
        hintStyle: TextStyle(
          color: ThemeProvider.greyColor,
          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        ),
        filled: true,
        fillColor: readOnly == true
            ? ThemeProvider.greyColor
            : ThemeProvider.whiteColor,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: readOnly == true
                ? ThemeProvider.whiteColor
                : ThemeProvider.greyColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: readOnly == true
                ? ThemeProvider.whiteColor
                : ThemeProvider.greyColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: readOnly == true
                ? ThemeProvider.whiteColor
                : ThemeProvider.greyColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class MyTextformField3 extends StatelessWidget {
  final TextEditingController? textController;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLength;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;
  final dynamic onChanged;
  final bool? readOnly;
  final dynamic onTap;
  final TextCapitalization? textCapitalization;
  final dynamic inputFormatters;
  final dynamic counter;

  const MyTextformField3({
    super.key,
    this.textController,
    this.obscureText,
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.maxLength,
    this.validator,
    this.maxLines,
    this.onChanged,
    this.readOnly,
    this.onTap,
    this.textCapitalization,
    this.inputFormatters,
    this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        controller: textController,
        textInputAction: TextInputAction.next,
        enableInteractiveSelection: true,
        obscureText: obscureText == null ? false : obscureText!,
        maxLength: maxLength,
        maxLines: obscureText != null || maxLines == null ? 1 : maxLines,
        validator: validator,
        onChanged: onChanged,
        readOnly: readOnly ?? false,
        onTap: onTap,
        style: TextStyle(
          color: ThemeProvider.blackColor,
          fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
          height: 0.0,
        ),
        cursorColor: ThemeProvider.appColor,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        inputFormatters: inputFormatters ?? [],
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          counter: counter ?? const Offstage(),
          hintStyle: TextStyle(
            color: ThemeProvider.greyColor,
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
            height: 0.0,
          ),
          filled: true,
          fillColor: readOnly == true
              ? ThemeProvider.greyColor
              : ThemeProvider.whiteColor,
          border: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: ThemeProvider.transparentColor,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ThemeProvider.transparentColor,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: ThemeProvider.transparentColor,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}

class CapitalizeFirstLetterFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final text = newValue.text;
    final capitalizedText = text[0].toUpperCase() + text.substring(1);
    return newValue.copyWith(
      text: capitalizedText,
      selection: TextSelection.collapsed(offset: capitalizedText.length),
    );
  }
}
