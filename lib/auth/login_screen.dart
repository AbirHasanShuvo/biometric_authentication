// import 'package:fingerprint_login/auth/biometric_auth.dart';
// import 'package:fingerprint_login/screens/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   void login() {
//     bool showbiometric = false;

//     @override
//     void initState() {
//       super.initState();

//       final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

//       prefs.then((SharedPreferences prefs) {
//         bool isloggedin = prefs.getBool('isloggedin') ?? false;
//         bool isbiometricenabled = prefs.getBool('isbiometricenabled') ?? false;

//         if (isloggedin && isbiometricenabled) {
//           setState(() {
//             showbiometric = true;
//           });
//         } else {
//           setState(() {
//             showbiometric = false;
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//          showbiometric
//       ? GestureDetector(
//           onTap: () => Biometricauth().checkBiometric(
//               context, HomePage(), LoginScreen(),false),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.fingerprint,
//                 color: Colors.white,
//               ),
//               const SizedBox(width: 10),
//               const Text(
//                 'Tap to login with biometric',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         )
//       : Container(),

//       ],),
//     );
//   }
// }
