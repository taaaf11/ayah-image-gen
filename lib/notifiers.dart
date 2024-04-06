import 'package:flutter/material.dart';

class CurrentSurah extends ChangeNotifier {
  int? _surahNumber;

  void change(int? surahNumber) {
    _surahNumber = surahNumber;
    notifyListeners();
  }

  int? get surahNumber => _surahNumber;
}

// class AyahKey extends ChangeNotifier {
//   int? _surahNumber;
//   int? _ayahNumber;

//   void update(int surahNumber, int ayahNumber) {
//     _surahNumber = surahNumber;
//     _ayahNumber = ayahNumber;
//   }

//   int? get surahNumber => _surahNumber;
//   int? get ayahNumber => _ayahNumber;
// }

class CurrentAyah extends ChangeNotifier {
  int? _ayahNumber;

  void change(int? ayahNumber) {
    _ayahNumber = ayahNumber;
    notifyListeners();
  }

  int? get ayahNumber => _ayahNumber;
}
