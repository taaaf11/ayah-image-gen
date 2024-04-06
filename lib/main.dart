import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surah_name_ayah_image/ayah_card.dart';
import 'package:surah_name_ayah_image/ayah_number_field.dart';
import 'package:surah_name_ayah_image/card_dims_controls.dart';
import 'package:surah_name_ayah_image/notifiers.dart';
import 'package:surah_name_ayah_image/surah_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentSurah()),
        ChangeNotifierProvider(create: (context) => AyahKeyNotifier()),
        ChangeNotifierProvider(create: (context) => CurrentAyah()),
        ChangeNotifierProvider(create: (context) => FontsLoaded()),
        ChangeNotifierProvider(create: (context) => CardDimensions()),
      ],
      child: MaterialApp(
        title: 'Ayah Image Gen',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff16666f), brightness: Brightness.dark),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Ayah Image Gen'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SurahDropdown(),
                SizedBox(width: 20),
                AyahNumberField(),
                SizedBox(width: 20),
                WidthControl(),
                // HeightControl()
              ],
            ),
            AyahCard()
          ],
        ),
      ),
    );
  }
}
