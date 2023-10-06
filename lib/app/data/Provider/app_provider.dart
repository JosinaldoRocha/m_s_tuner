import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/repositories/microphone_repository.dart';
import 'package:m_s_afinador/app/data/repositories/tuning_repository.dart';

final tuningRepositoryProvider = Provider(
  (ref) => TuningRepository(),
);

final microphonePermissionProvider = Provider(
  (ref) => MicrophoneRepository(),
);
