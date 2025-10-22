import 'package:fingerprint_login/biometric/biometric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BiometricController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Login (GetX)'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                controller.status.value,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.fingerprint),
                label: controller.isAuthenticating.value
                    ? const Text('Authenticating...')
                    : const Text('Authenticate'),
                onPressed: controller.isAuthenticating.value
                    ? null
                    : controller.authenticateUser,
              ),
            ],
          );
        }),
      ),
    );
  }
}
