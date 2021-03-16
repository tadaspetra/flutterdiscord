import 'package:flutter/material.dart';
import 'package:riverpod_template/config/palette.dart';

class CustomTheme {
  ThemeData lightTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonColor: Palette.darkerGrey,
      canvasColor: Palette.lightGrey,
      accentColor: Palette.lightBlue,
      primaryColor: Palette.darkerGrey,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(ContinuousRectangleBorder(
            side: const BorderSide(color: Palette.lightBlue, width: 2),
            borderRadius: BorderRadius.circular(30.0),
          )),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18)),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 30),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            return (states.contains(MaterialState.pressed)) ? Palette.lightGrey : Palette.darkerGrey;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            return (states.contains(MaterialState.pressed)) ? Palette.darkerGrey : Palette.lightGrey;
          }),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
            return const TextStyle(fontSize: 18);
          }),
          padding: MaterialStateProperty.resolveWith<EdgeInsets>((states) {
            return const EdgeInsets.symmetric(horizontal: 30, vertical: 10);
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            return (states.contains(MaterialState.pressed)) ? Colors.red : Colors.red;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            return (states.contains(MaterialState.pressed)) ? Colors.red : Colors.red;
          }),
        ),
      ),
    );
  }
}
