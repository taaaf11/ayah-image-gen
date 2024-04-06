import 'package:flutter/material.dart';

class CurrentSurah extends ChangeNotifier {
  int? _surahNumber;

  void change(int? surahNumber) {
    _surahNumber = surahNumber;
    notifyListeners();
  }

  int? get surahNumber => _surahNumber;
}

class AyahKeyNotifier extends ChangeNotifier {
  int? _surahNumber;
  int? _ayahNumber;

  void update(int? surahNumber, int? ayahNumber) {
    _surahNumber = surahNumber;
    _ayahNumber = ayahNumber;
    notifyListeners();
  }

  int? get surahNumber => _surahNumber;
  int? get ayahNumber => _ayahNumber;
}

class CurrentAyah extends ChangeNotifier {
  int? _ayahNumber;

  void change(int? ayahNumber) {
    _ayahNumber = ayahNumber;
    notifyListeners();
  }

  int? get ayahNumber => _ayahNumber;
}

class FontsLoaded with ChangeNotifier {
  List<int> _fontsLoaded = [];

  void add(int pageNumber) {
    _fontsLoaded.add(pageNumber);
    _fontsLoaded = _fontsLoaded.toSet().toList();
  }

  bool isFontLoaded(int pageNumber) => _fontsLoaded.contains(pageNumber);
}

class CardDimensions extends ChangeNotifier {
  double _width = 400;

  void incWidth() {
    _width += 5;
    notifyListeners();
  }

  void decWidth() {
    _width -= 5;
    notifyListeners();
  }

  void updateWidth(double width) {
    _width = width;
    notifyListeners();
  }

  double get width => _width;
}
