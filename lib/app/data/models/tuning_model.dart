import 'note_model.dart';

class TuningModel {
  String id;
  String instrumentId;
  String tuningTypeId;
  List<NoteModel> notes;

  TuningModel({
    required this.id,
    required this.instrumentId,
    required this.tuningTypeId,
    required this.notes,
  });
}
