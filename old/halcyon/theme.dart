import 'package:flutter/material.dart';

/// The most basic categorization of themes into three main categories:
/// 1. Light - Fg: Black | Bg: White
/// 2. Dark - Fg: White | Bg: Dark Gray
/// 3. High Contrast - Fg: White | Bg: Black
enum HGenericThemes {
  high_contrast,
  dark,
  light;
}

/// Internal representation of the current theme state.
///
/// **Should not be exposed to external processes!**
HGenericThemes _halcyonUITheme = HGenericThemes.dark;

/// Set the current theme to another theme.
void setHalcyonTheme(HGenericThemes themes) =>
    _halcyonUITheme = themes;

/// Retrieves the currently held theme value.
///
/// **Note! This does not mean all UI elements have to respect this value or update according to a change.**
HGenericThemes halcyonTheme() => _halcyonUITheme;

/// true or false if the current theme is dark.
///
/// *Macro function*
bool isDarkMode() => _halcyonUITheme == HGenericThemes.dark;

/// true or false if the current theme is light
///
/// *Macro function*
bool isLightMode() =>
    _halcyonUITheme == HGenericThemes.light;

/// true or false if the current theme is high contrast
///
/// *Macro function*
bool isHighContrastMode() =>
    _halcyonUITheme == HGenericThemes.high_contrast;

/// Retrieves the finalized theme data using the selected theme data.
///
/// This returns a conglomerate [ThemeData] that contains all of the colors and generic themes.
ThemeData hHalcyonTheme() => ThemeData(
        colorScheme: switch (_halcyonUITheme) {
      HGenericThemes.high_contrast =>
        const ColorScheme.highContrastDark(),
      HGenericThemes.light => const ColorScheme.light(),
      HGenericThemes.dark => const ColorScheme.dark()
    });
