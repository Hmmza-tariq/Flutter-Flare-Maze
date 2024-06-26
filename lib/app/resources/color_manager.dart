import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xFF7249EC);
  static const Color lightPrimary = Color(0xFF906AFF);
  static const Color lightestPrimary = Color(0xFFE2DAFB);
  static const Color darkPrimary = Color(0xFF240C6F);
  static const Color primary50 = Color(0xFFF1EDFD);
  static const Color primary500 = Color(0xFF7249EC);

  static const Color secondary = Color(0xFFF8FAFC);
  static const Color tertiary = Color(0xFFF1F5F9);

  static const Color green = Color(0xFF14C15A);
  static const Color lightGreen = Color(0xFFD9FBE7);

  static const Color yellow = Color(0xFFF7E634);
  static const Color lightYellow = Color(0xFFFEFBDF);

  static const Color orange = Color(0xFFFF8802);
  static const Color pink = Color(0xFF9E00FF);

  static const Color darkGrey = Color(0xFF232323);

  static const Color lightestGrey = Color(0xffF3F5F7);
  static const Color lightGrey = Color(0x9F8B94AC);
  static const Color lightGrey1 = Color(0xFFcbcbcb);
  static const Color lightGrey2 = Color(0xFF64748B);
  static const Color lightGrey3 = Color(0xFF8d8d8d);

  static const Color error = Color(0xFFD8464D);
  static const Color lightError = Color(0xFFFFEBEC);

  static const Color warning = Color(0xFFFDB022);

  static const Color transparent = Color.fromARGB(0, 255, 255, 255);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color(0xFF000000);
  static const Color shadow = Color.fromARGB(38, 180, 209, 209);

  static const loginGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primary,
      pink,
    ], // ForestGreen
  );

  static const Color textColor = black;

  static const primaryShadow = BoxShadow(
    color: Color(0xffB4D1D1),
    blurRadius: 60,
    offset: Offset(0, 30),
  );
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
