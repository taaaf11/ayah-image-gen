import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surah_name_ayah_image/notifiers.dart';

class WidthControl extends StatefulWidget {
  const WidthControl({super.key});

  @override
  State<WidthControl> createState() => _WidthControlState();
}

class _WidthControlState extends State<WidthControl> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cardDimsState = Provider.of<CardDimensions>(context);
    _textEditingController.text = cardDimsState.width.toString();

    return Row(
      children: [
        const Text('Width: '),
        // Text(cardDimsState.width.toString()),
        SizedBox(
          width: 70,
          child: TextField(
            controller: _textEditingController,
            // enableInteractiveSelection: false,
            onSubmitted: (value) {
              cardDimsState.updateWidth(double.parse(value));
            },
          ),
        ),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_drop_up),
              onPressed: () => cardDimsState.incWidth(),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: () => cardDimsState.decWidth(),
            )
          ],
        )
      ],
    );
  }
}
