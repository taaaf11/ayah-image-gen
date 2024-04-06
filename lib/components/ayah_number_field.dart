import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surah_name_ayah_image/utils.dart';

import '../notifiers.dart';

class AyahNumberField extends StatefulWidget {
  const AyahNumberField({super.key});

  @override
  State<AyahNumberField> createState() => _AyahNumberFieldState();
}

class _AyahNumberFieldState extends State<AyahNumberField> {
  @override
  Widget build(BuildContext context) {
    var currentSurah = Provider.of<CurrentSurah>(context);
    var currentAyah = Provider.of<CurrentAyah>(context);
    var stateAyahKey = Provider.of<AyahKeyNotifier>(context);

    return SizedBox(
      width: 100,
      child: TextField(
        decoration: const InputDecoration(border: OutlineInputBorder()),
        onChanged: (String value) {
          if (currentSurah.surahNumber != null) {
            int ayahNumber = int.parse(value);
            if (validateAyahNumber(currentSurah.surahNumber!, ayahNumber)) {
              currentAyah.change(ayahNumber);
              stateAyahKey.update(currentSurah.surahNumber, ayahNumber);
            }
          }
        },
      ),
    );
  }
}
