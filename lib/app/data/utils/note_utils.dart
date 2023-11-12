import '../models/note_model.dart';
import '../repositories/note_repository.dart';

class NoteUtils {
  static NoteModel getNote(double? frequency) {
    String noteId;
    if (frequency != null) {
      if (frequency < 31.78) {
        noteId = 'B0';
      } else if (frequency < 33.67) {
        noteId = 'C1';
      } else if (frequency < 35.95) {
        noteId = 'C#/Db1';
      } else if (frequency < 37.80) {
        noteId = 'D1';
      } else if (frequency < 40.04) {
        noteId = 'D#/Eb1';
      } else if (frequency < 42.42) {
        noteId = 'E1';
      } else if (frequency < 44.95) {
        noteId = 'F1';
      } else if (frequency < 47.62) {
        noteId = 'F#/Gb1';
      } else if (frequency < 50.45) {
        noteId = 'G1';
      } else if (frequency < 53.45) {
        noteId = 'G#/Ab1';
      } else if (frequency < 56.63) {
        noteId = 'A1';
      } else if (frequency < 60.00) {
        noteId = 'A#/Bb1';
      } else if (frequency < 63.57) {
        noteId = 'B1';
      } else if (frequency < 67.35) {
        noteId = 'C2';
      } else if (frequency < 71.36) {
        noteId = 'C#/Db2';
      } else if (frequency < 75.60) {
        noteId = 'D2';
      } else if (frequency < 80.09) {
        noteId = 'D#/Eb2';
      } else if (frequency < 84.86) {
        noteId = 'E2';
      } else if (frequency < 89.90) {
        noteId = 'F2';
      } else if (frequency < 95.25) {
        noteId = 'F#/Gb2';
      } else if (frequency < 100.91) {
        noteId = 'G2';
      } else if (frequency < 106.91) {
        noteId = 'G#/Ab2';
      } else if (frequency < 113.27) {
        noteId = 'A2';
      } else if (frequency < 120.00) {
        noteId = 'A#/Bb2';
      } else if (frequency < 127.14) {
        noteId = 'B2';
      } else if (frequency < 134.70) {
        noteId = 'C3';
      } else if (frequency < 142.71) {
        noteId = 'C#/Db3';
      } else if (frequency < 151.19) {
        noteId = 'D3';
      } else if (frequency < 160.18) {
        noteId = 'D#/Eb3';
      } else if (frequency < 169.71) {
        noteId = 'E3';
      } else if (frequency < 179.80) {
        noteId = 'F3';
      } else if (frequency < 190.50) {
        noteId = 'F#/Gb3';
      } else if (frequency < 201.82) {
        noteId = 'G3';
      } else if (frequency < 213.82) {
        noteId = 'G#/Ab3';
      } else if (frequency < 226.54) {
        noteId = 'A3';
      } else if (frequency < 240.01) {
        noteId = 'A#/Bb3';
      } else if (frequency < 254.285) {
        noteId = 'B3';
      } else if (frequency < 269.40) {
        noteId = 'C4';
      } else if (frequency < 285.42) {
        noteId = 'C#/Db4';
      } else if (frequency < 302.39) {
        noteId = 'D4';
      } else if (frequency < 320.38) {
        noteId = 'D#/Eb4';
      } else if (frequency < 339.43) {
        noteId = 'E4';
      } else if (frequency < 359.61) {
        noteId = 'F4';
      } else if (frequency < 380.99) {
        noteId = 'F#/Gb4';
      } else if (frequency < 403.65) {
        noteId = 'G4';
      } else if (frequency < 427.65) {
        noteId = 'G#/Ab4';
      } else if (frequency < 453.08) {
        noteId = 'A4';
      } else if (frequency < 480.02) {
        noteId = 'A#/Bb4';
      } else if (frequency < 508.56) {
        noteId = 'B4';
      } else if (frequency < 538.81) {
        noteId = 'C5';
      } else if (frequency < 570.85) {
        noteId = 'C#/Db5';
      } else if (frequency < 604.79) {
        noteId = 'D5';
      } else if (frequency < 640.75) {
        noteId = 'D#/Eb5';
      } else if (frequency < 678.86) {
        noteId = 'E5';
      } else if (frequency < 719.22) {
        noteId = 'F5';
      } else if (frequency < 761.99) {
        noteId = 'F#/Gb5';
      } else if (frequency < 807.30) {
        noteId = 'G5';
      } else if (frequency < 855.305) {
        noteId = 'G#/Ab5';
      } else if (frequency < 906.16) {
        noteId = 'A5';
      } else if (frequency < 960.05) {
        noteId = 'A#/Bb5';
      } else {
        noteId = 'B5';
      }
    } else {
      noteId = 'B5';
    }

    final note =
        NoteRepository().noteList.firstWhere((element) => element.id == noteId);

    return note;
  }
}
