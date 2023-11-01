import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/Provider/app_provider.dart';
import 'package:m_s_afinador/app/presentation/tune/states/list_instruments/list_instruments_state.dart';
import 'package:m_s_afinador/app/presentation/tune/states/microphone_permission/microphone_permission_state_notifier.dart';
import '../states/list_instruments/list_instruments_state_notifier.dart';
import '../states/microphone_permission/microphone_permission_state.dart';

final listInstrumentsProvider =
    StateNotifierProvider<ListInstrumentsStateNotifier, ListInstrumentsState>(
  (ref) => ListInstrumentsStateNotifier(
    repository: ref.read(tuningRepositoryProvider),
  ),
);

final microphoneProvider = StateNotifierProvider<
    MicrophonePermissionStateNotifier, MicrophonePermissionState>(
  (ref) => MicrophonePermissionStateNotifier(
    repository: ref.read(microphonePermissionProvider),
  ),
);
