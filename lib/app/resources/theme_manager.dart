import 'package:google_fonts/google_fonts.dart';
import 'color_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  Map<int, Color> colorSwatch = {
    50: const Color.fromRGBO(87, 76, 169, .1),
    100: const Color.fromRGBO(87, 76, 169, .2),
    200: const Color.fromRGBO(87, 76, 169, .3),
    300: const Color.fromRGBO(87, 76, 169, .4),
    400: const Color.fromRGBO(87, 76, 169, .5),
    500: const Color.fromRGBO(87, 76, 169, .6),
    600: const Color.fromRGBO(87, 76, 169, .7),
    700: const Color.fromRGBO(87, 76, 169, .8),
    800: const Color.fromRGBO(87, 76, 169, .9),
    900: const Color.fromRGBO(87, 76, 169, 1),
  };
  return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ColorManager.white,
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.lightGrey1,
      splashColor: ColorManager.transparent,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(0xFF574CA9, colorSwatch),
      ),
      dividerColor: Colors.transparent,
      //Card Theme
      cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.lightGrey3,
        elevation: AppSize.s4,
      ),

      //AppBar Theme
      appBarTheme: AppBarTheme(
          // color: ColorManager.primary,
          backgroundColor: ColorManager.white,
          centerTitle: true,
          elevation: AppSize.s4,
          shadowColor: ColorManager.lightPrimary,
          iconTheme: const IconThemeData(
            color: ColorManager.white,
          ),
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: AppSize.s16)),

      //Button Theme
      buttonTheme: const ButtonThemeData(
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary,
        shape: StadiumBorder(),
        disabledColor: ColorManager.lightGrey1,
      ),

      //Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorManager.white,
          backgroundColor: ColorManager.primary,
          textStyle: GoogleFonts.pressStart2p(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s8)),
        ),
      ),

      //Text theme
      textTheme: GoogleFonts.pressStart2pTextTheme(),

      //Input Decoration theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(color: ColorManager.lightGrey),
        labelStyle: getMediumStyle(color: ColorManager.lightGrey),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide:
                BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5)),
      ),
      dialogTheme: const DialogTheme(backgroundColor: ColorManager.white),
      expansionTileTheme: const ExpansionTileThemeData(
        collapsedBackgroundColor: ColorManager.white,
      ));
}
