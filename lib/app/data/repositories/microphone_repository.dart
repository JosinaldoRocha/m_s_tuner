import 'package:permission_handler/permission_handler.dart';

class MicrophoneRepository {
  Future<PermissionStatus> microphonePermission() async {
    var permission = await Permission.microphone.status;
    if (permission.isDenied) {
      permission = await Permission.microphone.request();
      if (permission.isDenied) {
        return PermissionStatus.denied;
      }
    }

    if (permission == PermissionStatus.permanentlyDenied) {
      return PermissionStatus.permanentlyDenied;
    }

    return PermissionStatus.granted;
  }
}
