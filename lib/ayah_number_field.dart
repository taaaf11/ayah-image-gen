import 'package:flutter/material.dart';

class AyahNumberField extends StatefulWidget {
  const AyahNumberField({super.key});

  @override
  State<AyahNumberField> createState() => _AyahNumberFieldState();
}

class _AyahNumberFieldState extends State<AyahNumberField> {
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
    return SizedBox(
      width: 100,
      child: TextField(
        decoration: InputDecoration(border: OutlineInputBorder()),
        controller: _textEditingController,
      ),
    );
  }
}
