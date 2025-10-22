import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class BiometricController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();

  RxString status = 'Not authenticated'.obs;
  RxBool isAuthenticating = false.obs;

  Future<void> authenticateUser() async {
    try {
      isAuthenticating.value = true;

      final bool deviceSupported = await auth.isDeviceSupported();
      final bool canCheckBiometrics = await auth.canCheckBiometrics;

      if (!deviceSupported || !canCheckBiometrics) {
        status.value = 'Biometrics not available or not enrolled';
        isAuthenticating.value = false;
        return;
      }

      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        biometricOnly: true,
        sensitiveTransaction: false,
        persistAcrossBackgrounding: true,
      );

      status.value = didAuthenticate
          ? '✅ Authenticated successfully!'
          : '❌ Authentication failed';
    } catch (e) {
      status.value = 'Error: $e';
    } finally {
      isAuthenticating.value = false;
    }
  }
}
