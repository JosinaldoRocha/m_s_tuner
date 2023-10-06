import 'package:permission_handler/permission_handler.dart';

abstract class MicrophonePermissionState {}

class InitialMicrophonePermissionState extends MicrophonePermissionState {}

class LoadingMicrophonePermissionState extends MicrophonePermissionState {}

class SuccessMicrophonePermissionState extends MicrophonePermissionState {
  final PermissionStatus data;
  SuccessMicrophonePermissionState({required this.data});
}

class FailureMicrophonePermissionState extends MicrophonePermissionState {
  final String errorMessage;
  FailureMicrophonePermissionState({required this.errorMessage});
}
