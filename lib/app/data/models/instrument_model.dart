import 'package:m_s_afinador/app/data/models/tuning_types_model.dart';

class InstrumentModel {
  String id;
  String title;
  List<TuningTypesModel> tuningTypes;

  InstrumentModel({
    required this.id,
    required this.title,
    required this.tuningTypes,
  });
}
