import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurahNameBox extends StatefulWidget {
  int? surahNumber;

  SurahNameBox({super.key, this.surahNumber});

  @override
  State<SurahNameBox> createState() => _SurahNameBoxState();
}

class _SurahNameBoxState extends State<SurahNameBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('moon.svg', width: 20, height: 20),
          Text(widget.surahNumber.toString()),
          SvgPicture.asset('moon.svg', width: 20, height: 20)
        ],
      ),
    );
  }
}
