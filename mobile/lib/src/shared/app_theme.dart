import 'package:flutter/material.dart';
import 'package:waiter_app/src/shared/app_text_styles.dart';

class AppTheme {
  static final themeLight = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    inputDecorationTheme: _inputDecorationTheme,
    fontFamily: 'GeneralSans',
    textTheme: _textTheme,
  );

  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    // primary
    primary: Color(0xffd73035),
    primaryContainer: Color(0xffd73035),
    onPrimary: Color(0xffFFFFFF),
    // secondary
    secondary: Color(0xff8a1114),
    secondaryContainer: Color(0xff8a1114),
    onSecondary: Color(0xffFFFFFF),
    // tertiary
    tertiary: Color(0xffffabad),
    tertiaryContainer: Color(0xffffabad),
    onTertiary: Color(0xff000000),
    // error
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    // neutral
    background: Color(0xFFFFFFFF),
    onBackground: Color(0xFF000000),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),

    // background card
    surfaceTint: Color(0xFFFAFAFA),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 2,
      ),
    ),
  );

  static const _textTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge,
    displayMedium: AppTextStyles.displayMedium,
    displaySmall: AppTextStyles.displaySmall,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.headlineSmall,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    titleSmall: AppTextStyles.titleSmall,
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.bodySmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.labelSmall,
  );
}
