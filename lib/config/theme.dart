import 'package:flutter/material.dart';

class Palette {
  static Color primary = Colors.black;

  static MaterialColor primarySwatch = MaterialColor(
    primary.value,
    <int, Color>{
      50: primary.withOpacity(0.1),
      100: primary.withOpacity(0.2),
      200: primary.withOpacity(0.3),
      300: primary.withOpacity(0.4),
      400: primary.withOpacity(0.5),
      500: primary.withOpacity(0.6),
      600: primary.withOpacity(0.7),
      700: primary.withOpacity(0.8),
      800: primary.withOpacity(0.9),
      900: primary.withOpacity(1.0),
    },
  );
}
