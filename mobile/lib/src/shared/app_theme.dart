import 'package:flutter/material.dart';
import 'package:waiter_app/src/shared/app_text_styles.dart';

import 'app_colors.dart';

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
    primary: AppColors.primary,
    primaryContainer: AppColors.primary,
    onPrimary: Color(0xffFFFFFF),
    // secondary
    secondary: AppColors.secondary,
    secondaryContainer: AppColors.secondary,
    onSecondary: Color(0xffFFFFFF),
    // tertiary
    tertiary: AppColors.tertiary,
    tertiaryContainer: AppColors.tertiary,
    onTertiary: Color(0xff000000),
    // error
    error: AppColors.error,
    onError: Color(0xFFFFFFFF),
    // neutral
    background: Color(0xFFFFFFFF),
    onBackground: Color(0xFF000000),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),

    // background card
    surfaceTint: AppColors.surfaceTint,
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
