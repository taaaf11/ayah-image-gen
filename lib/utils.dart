import 'surah_data.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

bool validateAyahNumber(int surahNumber, int ayahNumber) =>
    ayahNumber <= surahData[surahNumber]![0];

Future<ByteData> fetchFontBytes(int pageNumber) async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/quran/quran.com-frontend-next/master/public/fonts/quran/hafs/v1/ttf/p$pageNumber.ttf'));

  if (response.statusCode == 200) {
    return ByteData.view(response.bodyBytes.buffer);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load font');
  }
}
