import 'package:permission_handler/permission_handler.dart';

class MicrophoneRepository {
  Future<PermissionStatus> microphonePermission() async {
    await Future.delayed(const Duration(seconds: 1));
    var permission = await Permission.microphone.status;
    if (permission.isDenied) {
      permission = await Permission.microphone.request();
      if (permission.isDenied) {
        permission = PermissionStatus.denied;
      }
    }

    if (permission == PermissionStatus.permanentlyDenied) {
      permission = PermissionStatus.permanentlyDenied;
    }

    return permission;
  }
}
