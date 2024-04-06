import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'notifiers.dart';
import 'surah_names.dart';

class SurahNameBox extends StatefulWidget {
  int? surahNumber;

  SurahNameBox({super.key, this.surahNumber});

  @override
  State<SurahNameBox> createState() => _SurahNameBoxState();
}

class _SurahNameBoxState extends State<SurahNameBox> {
  @override
  Widget build(BuildContext context) {
    var cardDimsState = Provider.of<CardDimensions>(context);

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      width: cardDimsState.width - 40,
      // height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'moon.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
            width: 40,
            height: 40,
          ),
          Text('${surahNames['0']}${surahNames[widget.surahNumber.toString()]}',
              style:
                  const TextStyle(fontFamily: 'SurahNamesFont', fontSize: 30)),
          SvgPicture.asset(
            'moon.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
            width: 40,
            height: 40,
          )
        ],
      ),
    );
  }
}
