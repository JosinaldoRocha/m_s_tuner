import 'package:m_s_afinador/app/data/models/tuning_model.dart';

abstract class TuningState {}

class InitialTuningState extends TuningState {}

class LoadingTuningState extends TuningState {}

class SuccessTuningState extends TuningState {
  final TuningModel data;
  SuccessTuningState({required this.data});
}

class FailureTuningState extends TuningState {
  final String errorMessage;
  FailureTuningState({required this.errorMessage});
}
