import 'package:flutter/material.dart';
import 'package:fortune_cookie/utip.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding();
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const UTip(),
    ),
  );
}
