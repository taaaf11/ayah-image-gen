import 'package:flutter/material.dart';
import 'package:surah_name_ayah_image/surah_data.dart';

class SurahDropdown extends StatelessWidget {
  const SurahDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: [
        for (final surahData in surahData.entries)
          DropdownMenuEntry(
            value: surahData.key,
            label: '${surahData.key}. ${surahData.value[1]}',
          )
      ],
      onSelected: (value) {},
    );
  }
}
