// import 'package:fingerprint_login/screens/second_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:pinput/pinput.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final LocalAuthentication auth = LocalAuthentication();
//   final String pin = '1234';
//   final TextEditingController controller = TextEditingController();
//   bool biometricAvailable = false;
//   bool isLoading = false;
//   @override
//   void initState() {
//     super.initState();
//     _checkBiometricAvailability();
//   }

//   void _checkBiometricAvailability() async {
//     try {
//       bool available = await auth.canCheckBiometrics;
//       setState(() {
//         biometricAvailable = available;
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             Center(
//               child: Text(
//                 'Enter PIN',
//                 style: TextStyle(
//                   fontSize: 28,
//                   color: Colors.black87,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),
//             Text(
//               'Please enter 4 digit pin to continue',
//               style: TextStyle(color: Colors.grey, fontSize: 19),
//             ),

//             const SizedBox(height: 32),
//             Pinput(
//               controller: controller,
//               length: 4,
//               onCompleted: _oncompleted,
//               autofocus: true,
//               obscureText: true,
//             ),

//             const Spacer(),

//             if (biometricAvailable)
//               Column(
//                 children: [
//                   Text(
//                     'or',
//                     style: TextStyle(fontSize: 19, color: Colors.grey),
//                   ),

//                   InkWell(
//                     borderRadius: BorderRadius.circular(30),
//                     onTap: isLoading ? null : _biometricAuthentication(),
//                     child: Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                         color: Colors.blue[50],
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.blue[200]!),
//                       ),
//                       child: isLoading
//                           ? CircularProgressIndicator(
//                               strokeWidth: 2,
//                               valueColor: AlwaysStoppedAnimation(Colors.blue),
//                             )
//                           : Icon(
//                               Icons.fingerprint,
//                               size: 36,
//                               color: Colors.blue[600],
//                             ),
//                     ),
//                   ),

//                   const SizedBox(height: 10),
//                   Text(
//                     'use biometric',
//                     style: TextStyle(fontSize: 19, color: Colors.blue[600]),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _oncompleted(String enterPin) {
//     if (enterPin == pin) {
//       _navigateToSecondScreen();
//     } else {
//       print('Pin does not match');
//       controller.clear();
//     }
//   }

//   void _navigateToSecondScreen() {
//     Navigator.of(
//       context,
//     ).pushReplacement(MaterialPageRoute(builder: (ctx) => SecondScreen()));
//   }

//   void _biometricAuthentication()async{
//     if(!biometricAvailable){
//       return;
//     }

//     setState(() {
//       isLoading = true;

//     });

//     try {
//   bool didAuthenticate = await auth.authenticate(
//     localizedReason: 'Text for localization reason',
//     options:  AuthenticationOptions(
//       biometricOnly: true,
//       stickyAuth: true,
//     ),
//   );

//   if (didAuthenticate) {
//     print('✅ Authentication successful');
//     // your login logic here
//   } else {
//     print('❌ Authentication failed');
//   }
// } catch (e) {
//   print('Error during authentication: $e');
// }

//   }
// }
