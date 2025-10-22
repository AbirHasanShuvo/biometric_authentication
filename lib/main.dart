// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: const BiometricScreen());
//   }
// }

// class BiometricScreen extends StatefulWidget {
//   const BiometricScreen({super.key});
//   @override
//   State<BiometricScreen> createState() => _BiometricScreenState();
// }

// class _BiometricScreenState extends State<BiometricScreen> {
//   final LocalAuthentication auth = LocalAuthentication();
//   String _status = 'Not authenticated';

//   Future<void> _authenticate() async {
//     try {
//       final bool deviceSupported = await auth.isDeviceSupported();
//       final bool canCheckBiometrics = await auth.canCheckBiometrics;

//       if (!deviceSupported || !canCheckBiometrics) {
//         setState(() => _status = 'Biometrics not available/enrolled');
//         return;
//       }

//       // NOTE: no AuthenticationOptions object — pass options as named params:
//       final bool didAuthenticate = await auth.authenticate(
//         localizedReason: 'Please authenticate to continue',
//         biometricOnly: true, // restrict to biometrics (no PIN/passcode)
//         sensitiveTransaction: false, // optional: mark as sensitive transaction
//         persistAcrossBackgrounding:
//             true, // survives brief backgrounding (old stickyAuth)
//       );

//       setState(
//         () => _status = didAuthenticate
//             ? '✅ Authenticated'
//             : '❌ Not authenticated',
//       );
//     } on Exception catch (e) {
//       // Prefer handling LocalAuthException in real apps for structured error codes
//       setState(() => _status = 'Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Biometric (local_auth 3.x)')),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(_status),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _authenticate,
//               child: const Text('Authenticate'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//updated

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:app_settings/app_settings.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BiometricScreen(),
//     );
//   }
// }

// class BiometricScreen extends StatefulWidget {
//   const BiometricScreen({super.key});
//   @override
//   State<BiometricScreen> createState() => _BiometricScreenState();
// }

// class _BiometricScreenState extends State<BiometricScreen> {
//   final LocalAuthentication auth = LocalAuthentication();
//   String _status = "Not Authenticated";

//   Future<void> _authenticate() async {
//     try {
//       final bool canCheck = await auth.canCheckBiometrics;
//       final bool isSupported = await auth.isDeviceSupported();
//       final available = await auth.getAvailableBiometrics();

//       if (!isSupported || !canCheck || available.isEmpty) {
//         setState(() => _status = "No biometrics found. Please add one.");
//         _openBiometricSettings();
//         return;
//       }

//       final didAuthenticate = await auth.authenticate(
//         localizedReason: 'Authenticate with your fingerprint',
//         biometricOnly: true,
//         persistAcrossBackgrounding: true,
//       );

//       setState(() {
//         _status = didAuthenticate ? "✅ Authenticated Successfully" : "❌ Failed";
//       });
//     } catch (e) {
//       setState(() => _status = "Error: $e");
//     }
//   }

//   void _openBiometricSettings() {
//     if (Platform.isAndroid) {
//       AppSettings.openAppSettings(type: AppSettingsType.security);
//     } else if (Platform.isIOS) {
//       AppSettings.openAppSettings(); // opens Face ID / Touch ID settings
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Biometric Setup/Login")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_status, style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _authenticate,
//               child: const Text("Authenticate / Add Fingerprint"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//using getx in the first code

import 'package:fingerprint_login/biometric/biometric_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biometric Auth Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const BiometricScreen(),
    );
  }
}
