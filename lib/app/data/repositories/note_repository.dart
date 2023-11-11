import '../models/note_model.dart';

class NoteRepository {
  NoteModel getNote(double frequency) {
    String noteId;

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

    final note = noteList.firstWhere((element) => element.id == noteId);

    return note;
  }

  final noteList = [
    NoteModel(
      id: 'B0',
      title: 'B',
      octave: 0,
      standardFrequency: 30.87,
      minimumFrequency: 0.0,
      maximumFrequency: 31.77,
    ),
    NoteModel(
      id: 'C1',
      title: 'C',
      octave: 1,
      standardFrequency: 32.70,
      minimumFrequency: 31.78,
      maximumFrequency: 33.66,
    ),
    NoteModel(
      id: 'C#/Db1',
      title: 'C#',
      octave: 1,
      standardFrequency: 34.65,
      minimumFrequency: 33.67,
      maximumFrequency: 35.94,
    ),
    NoteModel(
      id: 'D1',
      title: 'D',
      octave: 1,
      standardFrequency: 36.71,
      minimumFrequency: 35.95,
      maximumFrequency: 37.79,
    ),
    NoteModel(
      id: 'D#/Eb1',
      title: 'D#',
      octave: 1,
      standardFrequency: 38.89,
      minimumFrequency: 37.80,
      maximumFrequency: 40.03,
    ),
    NoteModel(
      id: 'E1',
      title: 'E',
      octave: 1,
      standardFrequency: 41.20,
      minimumFrequency: 40.04,
      maximumFrequency: 42.41,
    ),
    NoteModel(
      id: 'F1',
      title: 'F',
      octave: 1,
      standardFrequency: 43.65,
      minimumFrequency: 42.42,
      maximumFrequency: 44.94,
    ),
    NoteModel(
      id: 'F#/Gb1',
      title: 'F#',
      octave: 1,
      standardFrequency: 46.25,
      minimumFrequency: 44.95,
      maximumFrequency: 47.61,
    ),
    NoteModel(
      id: 'G1',
      title: 'G',
      octave: 1,
      standardFrequency: 49.00,
      minimumFrequency: 47.62,
      maximumFrequency: 50.44,
    ),
    NoteModel(
      id: 'G#/Ab1',
      title: 'G#',
      octave: 1,
      standardFrequency: 51.91,
      minimumFrequency: 50.45,
      maximumFrequency: 53.44,
    ),
    NoteModel(
      id: 'A1',
      title: 'A',
      octave: 1,
      standardFrequency: 55.00,
      minimumFrequency: 53.45,
      maximumFrequency: 56.62,
    ),
    NoteModel(
      id: 'A#/Bb1',
      title: 'A#',
      octave: 1,
      standardFrequency: 58.27,
      minimumFrequency: 56.63,
      maximumFrequency: 59.99,
    ),
    NoteModel(
      id: 'B1',
      title: 'B',
      octave: 1,
      standardFrequency: 61.74,
      minimumFrequency: 60.00,
      maximumFrequency: 63.56,
    ),
    NoteModel(
      id: 'C2',
      title: 'C',
      octave: 2,
      standardFrequency: 65.41,
      minimumFrequency: 63.57,
      maximumFrequency: 67.34,
    ),
    NoteModel(
      id: 'C#/Db2',
      title: 'C#',
      octave: 2,
      standardFrequency: 69.30,
      minimumFrequency: 67.35,
      maximumFrequency: 71.35,
    ),
    NoteModel(
      id: 'D2',
      title: 'D',
      octave: 2,
      standardFrequency: 73.42,
      minimumFrequency: 71.36,
      maximumFrequency: 75.59,
    ),
    NoteModel(
      id: 'D#/Eb2',
      title: 'D#',
      octave: 2,
      standardFrequency: 77.78,
      minimumFrequency: 75.60,
      maximumFrequency: 80.08,
    ),
    NoteModel(
      id: 'E2',
      title: 'E',
      octave: 2,
      standardFrequency: 82.41,
      minimumFrequency: 80.09,
      maximumFrequency: 84.85,
    ),
    NoteModel(
      id: 'F2',
      title: 'F',
      octave: 2,
      standardFrequency: 87.31,
      minimumFrequency: 84.86,
      maximumFrequency: 89.89,
    ),
    NoteModel(
      id: 'F#/Gb2',
      title: 'F#',
      octave: 2,
      standardFrequency: 92.50,
      minimumFrequency: 89.90,
      maximumFrequency: 95.24,
    ),
    NoteModel(
      id: 'G2',
      title: 'G',
      octave: 2,
      standardFrequency: 98.00,
      minimumFrequency: 95.25,
      maximumFrequency: 100.90,
    ),
    NoteModel(
      id: 'G#/Ab2',
      title: 'G#',
      octave: 2,
      standardFrequency: 103.83,
      minimumFrequency: 100.91,
      maximumFrequency: 106.90,
    ),
    NoteModel(
      id: 'A2',
      title: 'A',
      octave: 2,
      standardFrequency: 110.00,
      minimumFrequency: 106.91,
      maximumFrequency: 113.26,
    ),
    NoteModel(
      id: 'A#/Bb2',
      title: 'A#',
      octave: 2,
      standardFrequency: 116.54,
      minimumFrequency: 113.27,
      maximumFrequency: 119.99,
    ),
    NoteModel(
      id: 'B2',
      title: 'B',
      octave: 2,
      standardFrequency: 123.47,
      minimumFrequency: 120.00,
      maximumFrequency: 127.13,
    ),
    NoteModel(
      id: 'C3',
      title: 'C',
      octave: 3,
      standardFrequency: 130.81,
      minimumFrequency: 127.14,
      maximumFrequency: 134.69,
    ),
    NoteModel(
      id: 'C#/Db3',
      title: 'C#',
      octave: 3,
      standardFrequency: 138.59,
      minimumFrequency: 134.70,
      maximumFrequency: 142.70,
    ),
    NoteModel(
      id: 'D3',
      title: 'D',
      octave: 3,
      standardFrequency: 146.83,
      minimumFrequency: 142.71,
      maximumFrequency: 151.18,
    ),
    NoteModel(
      id: 'D#/Eb3',
      title: 'D#',
      octave: 3,
      standardFrequency: 155.56,
      minimumFrequency: 151.19,
      maximumFrequency: 160.17,
    ),
    NoteModel(
      id: 'E3',
      title: 'E',
      octave: 3,
      standardFrequency: 164.81,
      minimumFrequency: 160.18,
      maximumFrequency: 169.70,
    ),
    NoteModel(
      id: 'F3',
      title: 'F',
      octave: 3,
      standardFrequency: 174.61,
      minimumFrequency: 169.71,
      maximumFrequency: 179.79,
    ),
    NoteModel(
      id: 'F#/Gb3',
      title: 'F#',
      octave: 3,
      standardFrequency: 185.00,
      minimumFrequency: 179.80,
      maximumFrequency: 190.49,
    ),
    NoteModel(
      id: 'G3',
      title: 'G',
      octave: 3,
      standardFrequency: 196.00,
      minimumFrequency: 190.50,
      maximumFrequency: 201.81,
    ),
    NoteModel(
      id: 'G#/Ab3',
      title: 'G#',
      octave: 3,
      standardFrequency: 207.65,
      minimumFrequency: 201.82,
      maximumFrequency: 213.81,
    ),
    NoteModel(
      id: 'A3',
      title: 'A',
      octave: 3,
      standardFrequency: 220.00,
      minimumFrequency: 213.82,
      maximumFrequency: 226.53,
    ),
    NoteModel(
      id: 'A#/Bb3',
      title: 'A#',
      octave: 3,
      standardFrequency: 233.08,
      minimumFrequency: 226.54,
      maximumFrequency: 240.00,
    ),
    NoteModel(
      id: 'B3',
      title: 'B',
      octave: 3,
      standardFrequency: 246.94,
      minimumFrequency: 240.01,
      maximumFrequency: 254.27,
    ),
    NoteModel(
      id: 'C4',
      title: 'C',
      octave: 4,
      standardFrequency: 261.63,
      minimumFrequency: 254.28,
      maximumFrequency: 269.39,
    ),
    NoteModel(
      id: 'C#/Db4',
      title: 'C#',
      octave: 4,
      standardFrequency: 277.18,
      minimumFrequency: 269.40,
      maximumFrequency: 285.41,
    ),
    NoteModel(
      id: 'D4',
      title: 'D',
      octave: 4,
      standardFrequency: 293.66,
      minimumFrequency: 285.42,
      maximumFrequency: 302.38,
    ),
    NoteModel(
      id: 'D#/Eb4',
      title: 'D#',
      octave: 4,
      standardFrequency: 311.13,
      minimumFrequency: 302.39,
      maximumFrequency: 320.37,
    ),
    NoteModel(
      id: 'E4',
      title: 'E',
      octave: 4,
      standardFrequency: 329.63,
      minimumFrequency: 320.38,
      maximumFrequency: 339.42,
    ),
    NoteModel(
      id: 'F4',
      title: 'F',
      octave: 4,
      standardFrequency: 349.23,
      minimumFrequency: 339.43,
      maximumFrequency: 359.60,
    ),
    NoteModel(
      id: 'F#/Gb4',
      title: 'F#',
      octave: 4,
      standardFrequency: 369.99,
      minimumFrequency: 359.61,
      maximumFrequency: 380.98,
    ),
    NoteModel(
      id: 'G4',
      title: 'G',
      octave: 4,
      standardFrequency: 392.00,
      minimumFrequency: 380.99,
      maximumFrequency: 403.64,
    ),
    NoteModel(
      id: 'G#/Ab4',
      title: 'G#',
      octave: 4,
      standardFrequency: 415.30,
      minimumFrequency: 403.65,
      maximumFrequency: 427.64,
    ),
    NoteModel(
      id: 'A4',
      title: 'A',
      octave: 4,
      standardFrequency: 440.00,
      minimumFrequency: 427.65,
      maximumFrequency: 453.07,
    ),
    NoteModel(
      id: 'A#/Bb4',
      title: 'A#',
      octave: 4,
      standardFrequency: 466.16,
      minimumFrequency: 453.08,
      maximumFrequency: 480.01,
    ),
    NoteModel(
      id: 'B4',
      title: 'B',
      octave: 4,
      standardFrequency: 493.88,
      minimumFrequency: 480.02,
      maximumFrequency: 508.55,
    ),
    NoteModel(
      id: 'C5',
      title: 'C',
      octave: 5,
      standardFrequency: 523.25,
      minimumFrequency: 508.56,
      maximumFrequency: 538.80,
    ),
    NoteModel(
      id: 'C#/Db5',
      title: 'C#',
      octave: 5,
      standardFrequency: 554.37,
      minimumFrequency: 538.81,
      maximumFrequency: 570.84,
    ),
    NoteModel(
      id: 'D5',
      title: 'D',
      octave: 5,
      standardFrequency: 587.33,
      minimumFrequency: 570.85,
      maximumFrequency: 604.78,
    ),
    NoteModel(
      id: 'D#/Eb5',
      title: 'D#',
      octave: 5,
      standardFrequency: 622.25,
      minimumFrequency: 604.79,
      maximumFrequency: 640.74,
    ),
    NoteModel(
      id: 'E5',
      title: 'E',
      octave: 5,
      standardFrequency: 659.26,
      minimumFrequency: 640.75,
      maximumFrequency: 678.85,
    ),
    NoteModel(
      id: 'F5',
      title: 'F',
      octave: 5,
      standardFrequency: 698.46,
      minimumFrequency: 678.86,
      maximumFrequency: 719.21,
    ),
    NoteModel(
      id: 'F#/Gb5',
      title: 'F#',
      octave: 5,
      standardFrequency: 739.99,
      minimumFrequency: 719.22,
      maximumFrequency: 761.98,
    ),
    NoteModel(
      id: 'G5',
      title: 'G',
      octave: 5,
      standardFrequency: 783.99,
      minimumFrequency: 761.99,
      maximumFrequency: 807.29,
    ),
    NoteModel(
      id: 'G#/Ab5',
      title: 'G#',
      octave: 5,
      standardFrequency: 830.61,
      minimumFrequency: 807.30,
      maximumFrequency: 855.29,
    ),
    NoteModel(
      id: 'A5',
      title: 'A',
      octave: 5,
      standardFrequency: 880.00,
      minimumFrequency: 855.30,
      maximumFrequency: 906.15,
    ),
    NoteModel(
      id: 'A#/Bb5',
      title: 'A#',
      octave: 5,
      standardFrequency: 932.33,
      minimumFrequency: 906.16,
      maximumFrequency: 960.04,
    ),
    NoteModel(
      id: 'B5',
      title: 'B',
      octave: 5,
      standardFrequency: 987.77,
      minimumFrequency: 960.05,
      maximumFrequency: 1017.12,
    ),
  ];
}
