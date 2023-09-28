import 'package:m_s_afinador/app/data/models/tuning_types_model.dart';

abstract class ListTuningTypesState {}

class InitialListTuningTypesState extends ListTuningTypesState {}

class LoadingListTuningTypesState extends ListTuningTypesState {}

class SuccessListTuningTypesState extends ListTuningTypesState {
  final List<TuningTypesModel> data;
  SuccessListTuningTypesState({required this.data});
}

class FailureListTuningTypesState extends ListTuningTypesState {
  final String errorMessage;
  FailureListTuningTypesState({required this.errorMessage});
}
