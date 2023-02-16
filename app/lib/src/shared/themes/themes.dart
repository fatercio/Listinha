import 'package:flutter/material.dart';
part 'color_schemes.g.dart';

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _darkColorScheme.primaryContainer,
      ),
      segmentedButtonTheme: _segmentedButtonThemeData,
    );

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _lightColorScheme.primaryContainer,
      ),
      segmentedButtonTheme: _segmentedButtonThemeData,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _lightColorScheme.primary,
          foregroundColor: _lightColorScheme.onPrimary),
    );

MaterialApp materialApp(
  Widget widget,
) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.light,
    theme: lightTheme,
    darkTheme: darkTheme,
    home: widget,
  );
}

SegmentedButtonThemeData get _segmentedButtonThemeData =>
    SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                fontSize: 10,
              );
            }
            return const TextStyle(
              fontSize: 12,
            );
          },
        ),
      ),
    );
