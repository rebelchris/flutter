import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.pacificoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Testing Google Fonts',
            style: GoogleFonts.pacifico(),
          ),
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello World 👋',
        textDirection: TextDirection.ltr,
        style: GoogleFonts.pacifico(fontSize: 48),
      ),
    );
  }
}
