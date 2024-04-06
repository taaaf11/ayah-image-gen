import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surah_name_ayah_image/components/ayah_text.dart';
import 'package:surah_name_ayah_image/notifiers.dart';
import 'package:surah_name_ayah_image/components/surah_name_box.dart';

class AyahCard extends StatelessWidget {
  const AyahCard({super.key});

  @override
  Widget build(BuildContext context) {
    var cardDimsState = Provider.of<CardDimensions>(context);

    return Consumer(
      builder: ((BuildContext context, AyahKeyNotifier ayahKey, child) {
        if ((ayahKey.surahNumber != null && ayahKey.ayahNumber != null)) {
          return Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            shadowColor: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: cardDimsState.width,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SurahNameBox(surahNumber: ayahKey.surahNumber),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AyahText(
                      surahNumber: ayahKey.surahNumber!,
                      ayahNumber: ayahKey.ayahNumber!,
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
