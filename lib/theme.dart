import 'package:flutter/material.dart';

const darkColor = Color.fromRGBO(21, 21, 21, 1);
const lightColor = Color.fromRGBO(220, 214, 214, 1);

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme:
        const ColorScheme.light(background: lightColor, primary: darkColor));

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme:
        const ColorScheme.dark(background: darkColor, primary: lightColor));
