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
      if (result == PermissionStatus.granted) {
        state = SuccessMicrophonePermissionState(data: result);
      } else if (result == PermissionStatus.denied) {
        state = FailureMicrophonePermissionState(
            errorMessage: 'Permissão negada. Tente novamente');
      } else if (result == PermissionStatus.permanentlyDenied) {
        state = FailureMicrophonePermissionState(
            errorMessage:
                'Permissão negada. Para o afinador funcionar habilite '
                'o microfone nas configurações do dispositivo');
      }
    } catch (e) {
      state = FailureMicrophonePermissionState(
          errorMessage: 'Ocorreu um erro na solicitação');
    }
  }
}
