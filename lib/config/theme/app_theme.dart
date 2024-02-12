import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFDC0B0B);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.lime,
  Colors.yellow,
  Colors.cyan,
  Colors.white
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        // brightness: Brightness.dark
        );
  }
}
