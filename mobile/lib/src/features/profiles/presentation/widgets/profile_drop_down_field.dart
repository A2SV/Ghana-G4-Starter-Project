import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';

class ProfileDropDownField extends StatelessWidget {
  const ProfileDropDownField({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onChanged: (val) {},
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black,
      ),
      value: items.isEmpty ? null : items[0],
      items: items
          .map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppLightThemeColors.kVeryLightTextFieldBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppLightThemeColors.kPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
