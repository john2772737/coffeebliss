import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  final ThemeData themeData;
  final Color appBarColor;
  final Color iconColor;
  final Color bottomNavBarColor; // New property for Bottom Navigation Bar color

  ThemeState(this.themeData, this.appBarColor, this.iconColor, this.bottomNavBarColor);
}

class ThemeInitial extends ThemeState {
  ThemeInitial()
      : super(
    ThemeData.light(),
    Colors.blue,
    Colors.black, // Default icon color for light theme
    Colors.white, // Default Bottom Navigation Bar color for light theme
  );
}

class ThemeLight extends ThemeState {
  ThemeLight()
      : super(
    ThemeData.light(),
    Colors.blue,
    Colors.black, // Icon color for light theme
    Colors.white, // Bottom Navigation Bar color for light theme
  );
}

class ThemeDark extends ThemeState {
  ThemeDark()
      : super(
    ThemeData.dark(),
    Colors.black,
    Colors.white, // Icon color for dark theme
    Colors.grey[850]!, // Bottom Navigation Bar color for dark theme
  );
}
