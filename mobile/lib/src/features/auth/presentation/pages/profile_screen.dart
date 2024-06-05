
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starter_project/src/core/theme/text_theme.dart';

import '../../../../../generated/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final int iconSize=25;
class item{}

class _ProfileScreenState extends State<ProfileScreen> {

  final List<String> _dropdownItems=['Edit Profile'];
  String _selectedItem='Edit Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,

        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor:AppLightThemeColors.kPrimaryColor,
            foregroundColor: Colors.white,
            onPressed: (){},
            child: Icon(
              Icons.share,
              size: 50,

            ),
          ),
        ),


        // Body
        body:Stack(
          children: [
            Container(
              color: AppLightThemeColors.kContainerBackgroundColor,
              child: Column(

                children: [
                  SizedBox(
                    height: 150,
                  ),
                  // Categories Section

                  // Main Body Section
                  Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget> [
                              SizedBox(
                                height: 50,
                              ),

                              Container(
                                  child:Text('Biniyam Odu',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FontFamily.poppins,
                                      color: Colors.black,
                                    ),
                                  )
                              ),

                              Container(
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('biniyam@a2sv.org',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: FontFamily.poppins,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Icon(Icons.verified_outlined,
                                        color: Colors.green,
                                      )
                                    ],
                                  )
                              ),

                              Container(
                                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.width*0.06, 0, MediaQuery.of(context).size.width*0.06),
                                  child:OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: AppLightThemeColors.kLightTextColor,
                                          width: 2
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)

                                      ),
                                    ),
                                    onPressed: (){},
                                    child: DropdownButton(
                                      isExpanded: true,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                      value:_selectedItem,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedItem = newValue!;
                                        });
                                      },
                                      items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(value,
                                                style: CustomTextStyles.kDefaultTextTheme().displayMedium,
                                              ),
                                            )
                                        );
                                      }).toList(),

                                    ),
                                  )
                              ),

                              Container(
                                margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Icon(
                                        FontAwesomeIcons.instagram,
                                        size:MediaQuery.of(context).size.width*0.1 ,
                                      ),
                                      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                    ),
                                    Container(
                                      child: Icon(
                                        FontAwesomeIcons.x,
                                        size: MediaQuery.of(context).size.width*0.1 ,
                                      ),
                                      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                    ),
                                    Container(
                                      child: Icon(
                                        FontAwesomeIcons.facebook,
                                        size: MediaQuery.of(context).size.width*0.1 ,
                                      ),
                                      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                    ),
                                    Container(
                                      child: Icon(
                                        FontAwesomeIcons.threads,
                                        size: MediaQuery.of(context).size.width*0.1 ,
                                      ),
                                      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                child: Divider(
                                  color: AppLightThemeColors.kDarkTextColor, // Line color
                                  thickness: 2.0, // Line thickness
                                  indent: 20.0, // Left indent
                                  endIndent: 20.0, // Right indent
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.width*0.06, 0, MediaQuery.of(context).size.width*0.06),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Container(
                                              margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.06),
                                              child: Text('26',
                                                style: TextStyle(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: FontFamily.poppins,
                                                  color: AppLightThemeColors.kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppLightThemeColors.kSmallerContainerBackgroundColor, // Background color
                                              shape: BoxShape.circle, // Circular shape
                                              border: Border.all(
                                                color: Colors.white, // Border color
                                                width: 4.0, // Border width
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child:Text(
                                              'Blogs',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: FontFamily.poppins,
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(

                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Container(
                                              margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.06),
                                              child: Text('14k',
                                                style: TextStyle(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: FontFamily.poppins,
                                                  color: AppLightThemeColors.kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppLightThemeColors.kSmallerContainerBackgroundColor, // Background color
                                              shape: BoxShape.circle, // Circular shape
                                              border: Border.all(
                                                color: Colors.white, // Border color
                                                width: 4.0, // Border width
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child:Text(
                                              'Followers',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: FontFamily.poppins,
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Container(
                                              margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.06),
                                              child: Text('2k',
                                                style: TextStyle(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: FontFamily.poppins,
                                                  color: AppLightThemeColors.kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppLightThemeColors.kSmallerContainerBackgroundColor, // Background color
                                              shape: BoxShape.circle, // Circular shape
                                              border: Border.all(
                                                color: Colors.white, // Border color
                                                width: 4.0, // Border width
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child:Text(
                                              'Following',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: FontFamily.poppins,
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),

                              ),


                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top:MediaQuery.of(context).size.width*0.15,
              left: 110,
              child:Container(
                margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.06),
                child:Image.asset('assets/images/happy_user.png',
                  width: 120,
                  height: 120,
                ),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  shape: BoxShape.circle, // Circular shape
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 4.0, // Border width
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}

