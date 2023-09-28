import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/repositories/tuning_repository.dart';

final tuningProvider = Provider(
  (ref) => TuningRepository(),
);
