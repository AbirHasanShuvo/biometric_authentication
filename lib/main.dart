import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const BiometricScreen());
  }
}

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({super.key});
  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String _status = 'Not authenticated';

  Future<void> _authenticate() async {
    try {
      final bool deviceSupported = await auth.isDeviceSupported();
      final bool canCheckBiometrics = await auth.canCheckBiometrics;

      if (!deviceSupported || !canCheckBiometrics) {
        setState(() => _status = 'Biometrics not available/enrolled');
        return;
      }

      // NOTE: no AuthenticationOptions object — pass options as named params:
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        biometricOnly: true, // restrict to biometrics (no PIN/passcode)
        sensitiveTransaction: false, // optional: mark as sensitive transaction
        persistAcrossBackgrounding:
            true, // survives brief backgrounding (old stickyAuth)
      );

      setState(
        () => _status = didAuthenticate
            ? '✅ Authenticated'
            : '❌ Not authenticated',
      );
    } on Exception catch (e) {
      // Prefer handling LocalAuthException in real apps for structured error codes
      setState(() => _status = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biometric (local_auth 3.x)')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_status),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _authenticate,
              child: const Text('Authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}
