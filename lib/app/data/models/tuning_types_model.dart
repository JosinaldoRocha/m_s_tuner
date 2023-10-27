import 'note_model.dart';

class TuningTypesModel {
  String id;
  String title;
  List<NoteModel> tuning;

  TuningTypesModel({
    required this.id,
    required this.title,
    required this.tuning,
  });
}
