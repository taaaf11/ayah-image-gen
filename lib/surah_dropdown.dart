import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surah_name_ayah_image/notifiers.dart';
import 'package:surah_name_ayah_image/surah_data.dart';

class SurahDropdown extends StatelessWidget {
  const SurahDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    var currentSurah = Provider.of<CurrentSurah>(context);

    return DropdownMenu(
      dropdownMenuEntries: [
        for (final surahData in surahData.entries)
          DropdownMenuEntry(
            value: surahData.key,
            label: '${surahData.key}. ${surahData.value[1]}',
          )
      ],
      onSelected: (value) {
        currentSurah.change(value);
      },
    );
  }
}
