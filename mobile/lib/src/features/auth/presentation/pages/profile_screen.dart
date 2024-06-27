// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:starter_project/src/core/theme/text_theme.dart';
// import 'package:starter_project/src/features/auth/authentication.dart';

// import '../../../../../generated/fonts.gen.dart';
// import '../../../../core/theme/app_light_theme_colors.dart';

// const int iconSize = 25;

// class item {}

// class ProfileScreen extends StatefulWidget {
//   static const String routeName = 'profile-screen';
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final List<String> _dropdownItems = ['Edit Profile'];
//   String _selectedItem = 'Edit Profile';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: SizedBox(
//         width: 70,
//         height: 70,
//         child: FloatingActionButton(
//           key: const Key('floating-button'),
//           backgroundColor: AppLightThemeColors.kPrimaryColor,
//           foregroundColor: Colors.white,
//           onPressed: () {},
//           child: const Icon(
//             Icons.share,
//             size: 50,
//           ),
//         ),
//       ),

//       // Body
//       body: BlocBuilder<AuthBloc, AuthState>(
//         builder: (context, state) {
//           return Stack(
//             children: [
//               Container(
//                 color: AppLightThemeColors.kContainerBackgroundColor,
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 150,
//                     ),
//                     Expanded(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 500.0,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(30.0),
//                             topRight: Radius.circular(30.0),
//                           ),
//                         ),
//                         child: Container(
//                           margin: const EdgeInsets.all(20),
//                           child: Column(
//                             children: <Widget>[
//                               const SizedBox(
//                                 height: 50,
//                               ),
//                               Text(
//                                 // 'Biniyam Odu',
//                                 (context.read<AuthBloc>().state as AuthSuccess).user.firstName!,
//                                 key: const Key('user-name'),
//                                 style: TextStyle(
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: FontFamily.poppins,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               Container(
//                                   child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     'biniyam@a2sv.org',
//                                     key: const Key('user-email'),
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w500,
//                                       fontFamily: FontFamily.poppins,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   const Icon(
//                                     Icons.verified_outlined,
//                                     color: Colors.green,
//                                   )
//                                 ],
//                               )),
//                               Container(
//                                   margin: EdgeInsets.fromLTRB(
//                                       0,
//                                       MediaQuery.of(context).size.width * 0.06,
//                                       0,
//                                       MediaQuery.of(context).size.width * 0.06),
//                                   child: OutlinedButton(
//                                     style: OutlinedButton.styleFrom(
//                                       side: const BorderSide(
//                                           color: AppLightThemeColors
//                                               .kLightTextColor,
//                                           width: 2),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20)),
//                                     ),
//                                     onPressed: () {},
//                                     child: DropdownButton(
//                                       isExpanded: true,
//                                       style:
//                                           Theme.of(context).textTheme.bodyLarge,
//                                       value: _selectedItem,
//                                       onChanged: (String? newValue) {
//                                         setState(() {
//                                           _selectedItem = newValue!;
//                                         });
//                                       },
//                                       items: _dropdownItems
//                                           .map<DropdownMenuItem<String>>(
//                                               (String value) {
//                                         return DropdownMenuItem<String>(
//                                             value: value,
//                                             child: Container(
//                                               alignment: Alignment.center,
//                                               child: Text(
//                                                 value,
//                                                 style: CustomTextStyles
//                                                         .kDefaultTextTheme()
//                                                     .displayMedium,
//                                               ),
//                                             ));
//                                       }).toList(),
//                                     ),
//                                   )),
//                               Container(
//                                 margin: EdgeInsets.all(
//                                     MediaQuery.of(context).size.width * 0.02),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Container(
//                                       margin: EdgeInsets.all(
//                                           MediaQuery.of(context).size.width *
//                                               0.02),
//                                       child: Icon(
//                                         key: const Key('instagram-icon'),
//                                         FontAwesomeIcons.instagram,
//                                         size:
//                                             MediaQuery.of(context).size.width *
//                                                 0.1,
//                                       ),
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.all(
//                                           MediaQuery.of(context).size.width *
//                                               0.02),
//                                       child: Icon(
//                                         key: const Key('x-icon'),
//                                         FontAwesomeIcons.x,
//                                         size:
//                                             MediaQuery.of(context).size.width *
//                                                 0.1,
//                                       ),
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.all(
//                                           MediaQuery.of(context).size.width *
//                                               0.02),
//                                       child: Icon(
//                                         key: const Key('facebook-icon'),
//                                         FontAwesomeIcons.facebook,
//                                         size:
//                                             MediaQuery.of(context).size.width *
//                                                 0.1,
//                                       ),
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.all(
//                                           MediaQuery.of(context).size.width *
//                                               0.02),
//                                       child: Icon(
//                                         key: const Key('threads-icon'),
//                                         FontAwesomeIcons.threads,
//                                         size:
//                                             MediaQuery.of(context).size.width *
//                                                 0.1,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const Divider(
//                                 color: AppLightThemeColors
//                                     .kDarkTextColor, // Line color
//                                 thickness: 2.0, // Line thickness
//                                 indent: 20.0, // Left indent
//                                 endIndent: 20.0, // Right indent
//                               ),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(
//                                     0,
//                                     MediaQuery.of(context).size.width * 0.06,
//                                     0,
//                                     MediaQuery.of(context).size.width * 0.06),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: <Widget>[
//                                     Column(
//                                       children: <Widget>[
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: AppLightThemeColors
//                                                 .kSmallerContainerBackgroundColor, // Background color
//                                             shape: BoxShape
//                                                 .circle, // Circular shape
//                                             border: Border.all(
//                                               color:
//                                                   Colors.white, // Border color
//                                               width: 4.0, // Border width
//                                             ),
//                                           ),
//                                           child: Container(
//                                             margin: EdgeInsets.all(
//                                                 MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.06),
//                                             child: Text(
//                                               '26',
//                                               key: const Key('number-of-blogs'),
//                                               style: TextStyle(
//                                                 fontSize: 22.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: FontFamily.poppins,
//                                                 color: AppLightThemeColors
//                                                     .kPrimaryColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Text(
//                                           'Blogs',
//                                           key: const Key('blogs-text'),
//                                           style: TextStyle(
//                                             fontSize: 18.sp,
//                                             fontWeight: FontWeight.w500,
//                                             fontFamily: FontFamily.poppins,
//                                             color: Colors.black,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Column(
//                                       children: <Widget>[
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: AppLightThemeColors
//                                                 .kSmallerContainerBackgroundColor,
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                               color: Colors.white,
//                                               width: 4.0,
//                                             ),
//                                           ),
//                                           child: Container(
//                                             margin: EdgeInsets.all(
//                                                 MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.06),
//                                             child: Text(
//                                               '14k',
//                                               key: const Key(
//                                                   'number-of-followers'),
//                                               style: TextStyle(
//                                                 fontSize: 22.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: FontFamily.poppins,
//                                                 color: AppLightThemeColors
//                                                     .kPrimaryColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Text(
//                                           'Followers',
//                                           key: const Key('followers-text'),
//                                           style: TextStyle(
//                                             fontSize: 18.sp,
//                                             fontWeight: FontWeight.w500,
//                                             fontFamily: FontFamily.poppins,
//                                             color: Colors.black,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Column(
//                                       children: <Widget>[
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: AppLightThemeColors
//                                                 .kSmallerContainerBackgroundColor, // Background color
//                                             shape: BoxShape
//                                                 .circle, // Circular shape
//                                             border: Border.all(
//                                               color:
//                                                   Colors.white, // Border color
//                                               width: 4.0, // Border width
//                                             ),
//                                           ),
//                                           child: Container(
//                                             margin: EdgeInsets.all(
//                                                 MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.06),
//                                             child: Text(
//                                               '2k',
//                                               key: const Key(
//                                                   'number-of-following'),
//                                               style: TextStyle(
//                                                 fontSize: 22.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: FontFamily.poppins,
//                                                 color: AppLightThemeColors
//                                                     .kPrimaryColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Text(
//                                           'Following',
//                                           key: const Key('following-text'),
//                                           style: TextStyle(
//                                             fontSize: 18.sp,
//                                             fontWeight: FontWeight.w500,
//                                             fontFamily: FontFamily.poppins,
//                                             color: Colors.black,
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: MediaQuery.of(context).size.width * 0.15,
//                 left: 110,
//                 child: Container(
//                   key: const Key('profile-picture'),
//                   margin:
//                       EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
//                   decoration: BoxDecoration(
//                     color: Colors.white, // Background color
//                     shape: BoxShape.circle, // Circular shape
//                     border: Border.all(
//                       color: Colors.white, // Border color
//                       width: 4.0, // Border width
//                     ),
//                   ),
//                   child: Image.asset(
//                     'assets/images/happy_user.png',
//                     width: 120,
//                     height: 120,
//                   ),
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
