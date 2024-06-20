import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/utils/custom_extensions.dart';
import 'package:starter_project/src/core/theme/app_light_theme_colors.dart';
import 'package:starter_project/src/features/profiles/domain/domain.dart';
import 'package:starter_project/src/features/profiles/presentation/widgets/profile_text_field.dart';

import '../../data/data.dart';
import '../widgets/profile_drop_down_field.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  static const String routeName = "profile-edit-screen";

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}



class _ProfileEditPageState extends State<ProfileEditPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  void _showAndroidDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    final DateTime lastDate = DateTime(now.year + 1, now.month, now.day);

    DateTime? pickedDate = await showDatePicker(
        initialDate: now,
        context: context,
        firstDate: firstDate,
        lastDate: lastDate);
  }




  void _showIOSDatePicker() {
    showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (BuildContext context) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: 35.h,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    "Date of Birth",
                    style: context.textTheme.titleSmall!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 2.h),
                  const Divider(height: 0),
                  SizedBox(
                    height: 15.h,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      // dateOrder: DatePickerDateOrder.dmy,
                      onDateTimeChanged: (DateTime newDateTime) {},
                    ),
                  ),
                  const Divider(height: 0),
                  SizedBox(height: 2.h),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(double.infinity, 37),
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        backgroundColor: AppLightThemeColors.kPrimaryColor,
                      ),
                      child: Text(
                        "Update",
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontSize: 18.sp,
                          color: context.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -7.h,
              right: 10,
              child: IconButton(
                key: const ValueKey("close icon"),
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                  weight: 800,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: context.textTheme.titleSmall!,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 19.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: AppLightThemeColors.kTextFieldColor,
                      radius: 16.w,
                      backgroundImage:
                          const AssetImage("assets/images/superman.png"),
                    ),
                  ),
                  Positioned(
                    top: 12.h,
                    left: 55.w,
                    child: SizedBox(
                      width: 8.w,
                      height: 8.w,
                      child: FloatingActionButton.small(
                        elevation: 0,
                        backgroundColor: AppLightThemeColors.kPrimaryColor,
                        onPressed: () {},
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ProfileTextField(
                      labelText: "Binyam Odu",
                      prefixIcon: Icon(Icons.person_outline),
                      controller: nameController,
                    ),
                    const SizedBox(height: 10),
                    ProfileTextField(
                      key: const ValueKey("Date input"),
                      onTap: _showIOSDatePicker,
                      labelText: "27/05/1991",
                      prefixIcon: Icon(Icons.calendar_month),
                    ),
                    const SizedBox(height: 10),
                    ProfileTextField(
                      labelText: "binyam@a2sv.org",
                      prefixIcon: Icon(Icons.email_outlined),
                      controller: emailController,
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ProfileDropDownField(
                            items: ["+1 (US)", "+233 (GH)"],
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          flex: 5,
                          child: ProfileTextField(
                            labelText: "(308) 555-0121",
                            prefixIcon: null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const ProfileDropDownField(
                      items: ["Male", "Female", "Anything else"],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextButton(
                        onPressed: () {
                          //Navigator.of(context).pop();
                          ProfileRepositoryImpl().updateAccount(2, nameController.text,nameController.text, emailController.text);
                          //GoRouter.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(double.infinity, 37),
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          backgroundColor: AppLightThemeColors.kPrimaryColor,
                        ),
                        child: Text(
                          "Update",
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.sp,
                            color: context.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
