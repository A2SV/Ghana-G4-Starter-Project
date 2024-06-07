import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';


defaultPinTheme(Color borderColor, BuildContext context) {
  return PinTheme(
    width: context.width,
    height: 58.0,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(70, 69, 66, 1),
    ),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(232, 235, 241, 0.37),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor),
    ),
  );
}

focusedPinPutTheme(BuildContext context) {
  final borderColor = context.colorScheme.primary;
  return defaultPinTheme(borderColor, context).copyWith(
    decoration: BoxDecoration(
      color: context.colorScheme.primary.withOpacity(0.03),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: borderColor),
      boxShadow: const [
        BoxShadow(
          color: Color(0x0F000000),
          offset: Offset(0, 3),
          blurRadius: 10,
        )
      ],
    ),
  );
}

class CustomPinPutFormField extends StatelessWidget {
  final bool autofocus;

  final bool useNativeKeyboard;
  final FocusNode? pinPutFocusNode;
  final Function(String)? onChanged;
  final int? length;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isValid;
  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 146, 160, 1),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  CustomPinPutFormField({
    super.key,
    this.autofocus = true,
    this.useNativeKeyboard = true,
    this.pinPutFocusNode,
    this.onChanged,
    this.length,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.isValid = false,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = isValid ? context.colorScheme.primary : context.colorScheme.background;
    return Pinput(
      useNativeKeyboard: useNativeKeyboard,
      inputFormatters: inputFormatters ?? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      onChanged: onChanged,
      length: length ?? 4,
      autofocus: autofocus,
      focusNode: pinPutFocusNode,
      controller: controller,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      pinAnimationType: PinAnimationType.scale,
      cursor: cursor,
      defaultPinTheme: defaultPinTheme(borderColor, context),
      focusedPinTheme: focusedPinPutTheme(context),
      validator: validator,
      errorTextStyle: context.textTheme.bodyLarge!.copyWith(
        fontSize: 12.sp,
        color: context.colorScheme.error,
      ),
    );
  }
}
