import 'package:flutter/material.dart';

/// Theme management for UI Factory.
///
/// This class provides methods to set and manage global themes for UI Factory components.
class UIFactoryTheme {
  static ThemeData? _globalTheme;
  static Color _primaryColor = Colors.blue;
  static Color _secondaryColor = Colors.blueAccent;
  static Color _backgroundColor = Colors.white;
  static Color _textColor = Colors.black87;
  static double _borderRadius = 8.0;
  static double _elevation = 4.0;
  static String _fontFamily = 'Roboto';
  static bool _isDarkMode = false;
  static bool _useAnimations = true;
  static bool _isRTL = false;
  static EdgeInsetsGeometry _defaultPadding = const EdgeInsets.all(16.0);

  /// Sets the global theme for all UI Factory components.
  static void setGlobalTheme({
    ThemeData? theme,
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? textColor,
    double? borderRadius,
    double? elevation,
    String? fontFamily,
    bool? isDarkMode,
    bool? useAnimations,
    bool? isRTL,
    EdgeInsetsGeometry? defaultPadding,
  }) {
    _globalTheme = theme;
    _primaryColor = primaryColor ?? _primaryColor;
    _secondaryColor = secondaryColor ?? _secondaryColor;
    _backgroundColor = backgroundColor ?? _backgroundColor;
    _textColor = textColor ?? _textColor;
    _borderRadius = borderRadius ?? _borderRadius;
    _elevation = elevation ?? _elevation;
    _fontFamily = fontFamily ?? _fontFamily;
    _isDarkMode = isDarkMode ?? _isDarkMode;
    _useAnimations = useAnimations ?? _useAnimations;
    _isRTL = isRTL ?? _isRTL;
    _defaultPadding = defaultPadding ?? _defaultPadding;
  }

  /// Returns the current global theme.
  static ThemeData get globalTheme {
    if (_globalTheme != null) return _globalTheme!;

    return _isDarkMode ? _darkTheme : _lightTheme;
  }

  /// Returns the current primary color.
  static Color get primaryColor => _primaryColor;

  /// Returns the current secondary color.
  static Color get secondaryColor => _secondaryColor;

  /// Returns the current background color.
  static Color get backgroundColor => _backgroundColor;

  /// Returns the current text color.
  static Color get textColor => _textColor;

  /// Returns the current border radius.
  static double get borderRadius => _borderRadius;

  /// Returns the current elevation.
  static double get elevation => _elevation;

  /// Returns the current font family.
  static String get fontFamily => _fontFamily;

  /// Returns whether dark mode is enabled.
  static bool get isDarkMode => _isDarkMode;

  /// Returns whether animations are enabled.
  static bool get useAnimations => _useAnimations;

  /// Returns whether RTL is enabled.
  static bool get isRTL => _isRTL;

  /// Returns the default padding.
  static EdgeInsetsGeometry get defaultPadding => _defaultPadding;

  /// Returns the light theme.
  static ThemeData get _lightTheme {
    return ThemeData(
      primaryColor: _primaryColor,
      colorScheme: ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
        background: _backgroundColor,
      ),
      scaffoldBackgroundColor: _backgroundColor,
      fontFamily: _fontFamily,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: _textColor),
        bodyMedium: TextStyle(color: _textColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: _elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
      ),
    );
  }

  /// Returns the dark theme.
  static ThemeData get _darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: _primaryColor,
      colorScheme: ColorScheme.dark(
        primary: _primaryColor,
        secondary: _secondaryColor,
        background: Colors.grey[900]!,
      ),
      scaffoldBackgroundColor: Colors.grey[900],
      //  fontFamily: _fontFamily,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: _elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
      ),
    );
  }
}
