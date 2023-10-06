import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/repositories/microphone_repository.dart';
import 'package:permission_handler/permission_handler.dart';
import 'microphone_permission_state.dart';

class MicrophonePermissionStateNotifier
    extends StateNotifier<MicrophonePermissionState> {
  MicrophonePermissionStateNotifier({required this.repository})
      : super(InitialMicrophonePermissionState());
  final MicrophoneRepository repository;

  void loadPermission() async {
    state = LoadingMicrophonePermissionState();

    try {
      final result = await repository.microphonePermission();
      state = SuccessMicrophonePermissionState(data: result);
      if (result == PermissionStatus.granted) {
      } else if (result == PermissionStatus.denied ||
          result == PermissionStatus.permanentlyDenied) {
        state = FailureMicrophonePermissionState(
          errorMessage:
              'Suas permissões foram negadas, por favor tente novamente ou vá até as '
              'configurações do seu aplicativo e ative a permissão para prosseguir.',
        );
      } else {
        state = FailureMicrophonePermissionState(
          errorMessage: 'Localização negada.',
        );
      }
    } catch (e) {
      state = FailureMicrophonePermissionState(errorMessage: 'errorMessage');
    }
  }
}
