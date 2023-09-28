import 'package:m_s_afinador/app/data/models/instrument_model.dart';

abstract class ListInstrumentsState {}

class InitialListInstrumentsState extends ListInstrumentsState {}

class LoadingListInstrumentsState extends ListInstrumentsState {}

class SuccessListInstrumentsState extends ListInstrumentsState {
  final List<InstrumentModel> data;
  SuccessListInstrumentsState({required this.data});
}

class FailureListInstrumentsState extends ListInstrumentsState {
  final String errorMessage;
  FailureListInstrumentsState({required this.errorMessage});
}
