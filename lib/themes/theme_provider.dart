import 'package:flutter/material.dart';

class ThemeProvider {
  static ThemeData get light => ThemeData(
      primarySwatch: Colors.blue, useMaterial3: true, fontFamily: "Quicksand");
}
