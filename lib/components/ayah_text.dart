import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../notifiers.dart';
import '../utils.dart';

class AyahText extends StatefulWidget {
  final int surahNumber;
  final int ayahNumber;

  const AyahText(
      {super.key, required this.surahNumber, required this.ayahNumber});

  @override
  State<AyahText> createState() => _AyahTextState();
}

class _AyahTextState extends State<AyahText> {
  late FontsLoaded _fontsLoaded;
  String _textFamily = '';
  List<int> _loadedFonts = [];
  // ignore: prefer_final_fields
  Map<String, List<String>> _loadedAyahs = {};

  @override
  void initState() {
    super.initState();
    _fontsLoaded = Provider.of<FontsLoaded>(context, listen: false);
  }

  Future<String> fetchAyahV1() async {
    var uri = Uri.parse(
        'https://api.quran.com/api/v4/quran/verses/code_v1/?verse_key=${widget.surahNumber}:${widget.ayahNumber}');
    var response = await http.get(uri);

    var responseJson = jsonDecode(response.body);

    String verseKey = responseJson['verses'][0]['verse_key'];
    String ayahText = responseJson['verses'][0]['code_v1'];
    int pageNumber = responseJson['verses'][0]['v1_page'];

    await _getFont(pageNumber);

    _loadedAyahs[verseKey] = [ayahText, pageNumber.toString()];

    return ayahText;
  }

  Future<void> _getFont(int pageNumber) async {
    if (!_loadedFonts.contains(pageNumber)) {
      var fontLoader = FontLoader(pageNumber.toString());
      fontLoader.addFont(fetchFontBytes(pageNumber));
      await fontLoader.load();
      _textFamily = pageNumber.toString();
      _fontsLoaded.add(pageNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    String ayahKey = '${widget.surahNumber}:${widget.ayahNumber}';
    if (_loadedAyahs.containsKey(ayahKey)) {
      return Wrap(
        textDirection: TextDirection.rtl,
        alignment: WrapAlignment.center,
        children: [
          for (final textChar in _loadedAyahs[ayahKey]![0].split(''))
            Text(
              textChar,
              style: TextStyle(
                  fontFamily: _loadedAyahs[ayahKey]?[1], fontSize: 30),
            )
        ],
      );
    } else {
      return FutureBuilder(
        future: fetchAyahV1(),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Wrap(
                textDirection: TextDirection.rtl,
                alignment: WrapAlignment.center,
                children: [
                  for (final textChar in snapshot.data.toString().split(''))
                    Text(
                      textChar,
                      style: TextStyle(fontFamily: _textFamily, fontSize: 30),
                    )
                ],
              );
          }
        }),
      );
    }
  }
}
