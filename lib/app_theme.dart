import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/values/values.dart';

/// Adding app theme
class AppTheme {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor, Brightness.light);

  static ThemeData darkThemeData =
      themeData(darkColorScheme, _darkFocusColor, Brightness.dark);

  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
    Brightness brightness,
  ) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme(brightness),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: focusColor,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    surface: Color(0xFFFAFBFB),
    background: Color(0xFFFAFBFB),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    onBackground: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    surface: Color(0xFF121212),
    background: Color(0xFF121212),
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: Color(0xFFE0E0E0),
    onSurface: Color(0xFFE0E0E0),
    onBackground: Color(0xFFE0E0E0),
    brightness: Brightness.dark,
  );

  static const _bold = FontWeight.w700;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static TextTheme _textTheme(Brightness brightness) {
    final bool isLight = brightness == Brightness.light;
    final Color primaryTextColor = isLight ? AppColors.black : Colors.white;
    final Color secondaryTextColor =
        isLight ? AppColors.primaryText2 : Colors.grey[400]!;

    return TextTheme(
      displayLarge: GoogleFonts.gloriaHallelujah(
        fontSize: Sizes.TEXT_SIZE_96,
        color: primaryTextColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
      ),
      displayMedium: GoogleFonts.ibmPlexMono(
        fontSize: Sizes.TEXT_SIZE_60,
        color: primaryTextColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
      ),
      displaySmall: GoogleFonts.ibmPlexMono(
        fontSize: Sizes.TEXT_SIZE_48,
        color: primaryTextColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
      ),
      titleLarge: GoogleFonts.ibmPlexMono(
        fontSize: Sizes.TEXT_SIZE_34,
        color: primaryTextColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
      ),
      titleMedium: GoogleFonts.ibmPlexMono(
        fontSize: Sizes.TEXT_SIZE_24,
        color: primaryTextColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
      ),
      titleSmall: GoogleFonts.ibmPlexMono(
        fontSize: Sizes.TEXT_SIZE_20,
        color: primaryTextColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
      ),
      bodyLarge: GoogleFonts.ibmPlexMono(
        fontSize: Sizes.TEXT_SIZE_18,
        color: primaryTextColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
      ),
      bodyMedium: GoogleFonts.ibmPlexMono(
        fontSize: Sizes.TEXT_SIZE_14,
        color: primaryTextColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
      ),
      bodySmall: GoogleFonts.lato(
        fontSize: Sizes.TEXT_SIZE_16,
        color: secondaryTextColor,
        fontWeight: _regular,
        fontStyle: FontStyle.normal,
      ),
      labelLarge: GoogleFonts.ibmPlexMono(
        fontSize: Sizes.TEXT_SIZE_14,
        color: primaryTextColor,
        fontWeight: _light,
        fontStyle: FontStyle.normal,
      ),
      labelMedium: GoogleFonts.lato(
        fontSize: Sizes.TEXT_SIZE_16,
        color: primaryTextColor,
        fontStyle: FontStyle.normal,
        fontWeight: _regular,
      ),
      labelSmall: GoogleFonts.ibmPlexMono(
        fontSize: Sizes.TEXT_SIZE_12,
        color: isLight ? AppColors.primaryText1 : Colors.grey[400]!,
        fontWeight: _regular,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
