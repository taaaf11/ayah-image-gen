import 'surah_data.dart';

bool validateAyahNumber(int surahNumber, int ayahNumber) =>
    ayahNumber <= surahData[surahNumber]![0];
