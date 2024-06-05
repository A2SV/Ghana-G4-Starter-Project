
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/widgets/custom_button.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Delete Blog',
      horizontalPadding: 0.0,
      gradient: false,
      onPressed: () {},
      textStyle: context.textTheme.bodyMedium!.copyWith(
        fontSize: 18.sp,
        color: context.colorScheme.error,
        fontWeight: FontWeight.bold,
        // fontFamily: FontFamily.urbanist,
      ),
      borderColor: context.colorScheme.error,
    );
  }
}
