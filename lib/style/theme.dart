import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF416FDF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF416FDF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

class MyAppTheme {
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Moder',
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          lightColorScheme.primary, // Slightly darker shade for the button
        ),
        foregroundColor:
            WidgetStateProperty.all<Color>(Colors.white), // text color
        elevation: WidgetStateProperty.all<double>(5.0), // shadow
        padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Adjust as needed
          ),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    ),
  );

  static ThemeData darkMode = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Moder',
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          darkColorScheme.primary, // Slightly darker shade for the button
        ),
        foregroundColor:
            WidgetStateProperty.all<Color>(Colors.white), // text color
        elevation: WidgetStateProperty.all<double>(5.0), // shadow
        padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Adjust as needed
          ),
        ),
        fixedSize: WidgetStateProperty.all(Size(500, 20)),
      ),
    ),
    drawerTheme: const DrawerThemeData(
      surfaceTintColor: Colors.black,
    ),
  );

  static CupertinoThemeData lighttheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF416FDF),
    primaryContrastingColor: Color(0xFFFFFFFF),
    barBackgroundColor: Color(0xFF416FDF),
    applyThemeToAll: true,
  );

  static CupertinoThemeData darktheme = CupertinoThemeData(
    primaryColor: Color(0xFF416FDF),
    primaryContrastingColor: Color(0xFFFFFFFF),
    brightness: Brightness.dark,
    barBackgroundColor: Color(0xFF6EAEE7),
  );
}
