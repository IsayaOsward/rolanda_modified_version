// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   void _toEditPage(BuildContext context) {
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => const Editprofile(),
//     //   ),
//     // );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final profileDetails = Provider.of<AuthProvider>(context);
//     final authProvider = Provider.of<AuthProvider>(context);
//     final screenSize = MediaQuery.of(context).size;
//     if (authProvider.token == "" || authProvider.token == null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset("assets/hotel_images/lock.gif"),
//             const Text(
//                 "Sorry, we can not fetch your profile. This is because you are not logged in,\nKindly log in to access your profile", textAlign: TextAlign.center,),
//             const SizedBox(height: 20,),
//             SizedBox(
//               width: screenSize.width * 0.8,
//               child: ElevatedButton(
//                   style: ButtonStyle(
//                       // backgroundColor: const WidgetStatePropertyAll(darkBlue),
//                       // foregroundColor: const WidgetStatePropertyAll(whiteColor),
//                       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(7)))),
//                   onPressed: () =>
//                       Navigator.pushReplacementNamed(context, "/"),
//                   child: const Text("Login Now")),
//             )
//           ],
//         ),
//       );
//     } else {
//       return SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(vertical: 40),
//                   alignment: Alignment.topCenter,
//                   height: 140,
//                   decoration: const BoxDecoration(
//                     // color: primaryBlue,
//                     borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(90),
//                       bottomLeft: Radius.circular(90),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 60,
//                   child: Column(
//                     children: [
//                       Text(
//                         profileDetails.userProfile?['full_name'] ?? 'User Name',
//                         style: GoogleFonts.poppins(
//                           // color: whiteColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Container(
//                         height: 130,
//                         width: 130,
//                         decoration: BoxDecoration(
//                           // color: whiteColor,
//                           borderRadius: BorderRadius.circular(100),
//                           image: DecorationImage(
//                             image: profileDetails.userProfile?['image'] != null
//                                 ? NetworkImage(
//                                     "$baseUrl${profileDetails.userProfile?['image']}")
//                                 : const AssetImage("assets/icons/profile.jpg"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
//               decoration: BoxDecoration(
//                 // color: whiteColor,
//                 boxShadow: const [BoxShadow(blurRadius: 1)],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 40,
//                     child: TextField(
//                       readOnly: true,
//                       decoration: InputDecoration(
//                         hintText: profileDetails.userProfile?['full_name'] ??
//                             'Full Name',
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         hintStyle: GoogleFonts.poppins(
//                           // color: mediumGray,
//                         ),
//                         prefixIcon: const Icon(
//                           Icons.person_2_outlined,
//                           // color: lightBlue,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                     child: TextField(
//                       readOnly: true,
//                       decoration: InputDecoration(
//                         hintText: profileDetails.userProfile?['email'] ??
//                             'Email Address',
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         hintStyle: GoogleFonts.poppins(
//                           // color: mediumGray,
//                         ),
//                         prefixIcon: const Icon(
//                           Icons.email_outlined,
//                           // color: lightBlue,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                     child: TextField(
//                       readOnly: true,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         hintText: profileDetails.userProfile?['phone'] ??
//                             'Phone Number',
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         hintStyle: GoogleFonts.poppins(
//                           // color: mediumGray,
//                         ),
//                         prefixIcon: const Icon(
//                           Icons.call_outlined,
//                           // color: lightBlue,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                     child: TextField(
//                       readOnly: true,
//                       decoration: InputDecoration(
//                         hintText:
//                             profileDetails.userProfile?['address'] ?? 'Address',
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         hintStyle: GoogleFonts.poppins(
//                           // color: mediumGray,
//                         ),
//                         prefixIcon: const Icon(
//                           Icons.location_on_outlined,
//                           // color: lightBlue,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                     child: TextField(
//                       readOnly: true,
//                       decoration: InputDecoration(
//                         hintText:
//                             profileDetails.userProfile?['gender'] ?? 'Gender',
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         hintStyle: GoogleFonts.poppins(
//                           // color: mediumGray,
//                         ),
//                         prefixIcon: const Icon(
//                           Icons.info_outline,
//                           // color: lightBlue,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     width: screenSize.width,
//                     child: ElevatedButton(
//                       onPressed: () => _toEditPage(context),
//                       style: ButtonStyle(
//                         // foregroundColor:
//                         //     WidgetStateProperty.all<Color>(whiteColor),
//                         // backgroundColor:
//                         //     WidgetStateProperty.all<Color>(primaryBlue),
//                       ),
//                       child: Text(
//                         "Edit Profile",
//                         style: GoogleFonts.poppins(),
//                       ),
//                     ),
//                   ),
//                   // const SizedBox(height: 10),
//                   // SizedBox(
//                   //   width: screenSize.width,
//                   //   child: ElevatedButton(
//                   //     onPressed: () {},
//                   //     style: ButtonStyle(
//                   //       foregroundColor:
//                   //           WidgetStateProperty.all<Color>(whiteColor),
//                   //       backgroundColor:
//                   //           WidgetStateProperty.all<Color>(darkBlue),
//                   //     ),
//                   //     child: Text(
//                   //       "Change password",
//                   //       maxLines: 1,
//                   //       overflow: TextOverflow.ellipsis,
//                   //       style: GoogleFonts.poppins(),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }

// class ProfileField extends StatelessWidget {
//   final IconData icon;
//   final String hintText;

//   const ProfileField({
//     super.key,
//     required this.icon,
//     required this.hintText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40,
//       child: TextField(
//         readOnly: true,
//         decoration: InputDecoration(
//           hintText: hintText,
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 10,
//             vertical: 10,
//           ),
//           hintStyle: GoogleFonts.poppins(
//             // color: mediumGray,
//           ),
//           prefixIcon: Icon(
//             icon,
//             // color: lightBlue,
//           ),
//         ),
//       ),
//     );
//   }
// }
