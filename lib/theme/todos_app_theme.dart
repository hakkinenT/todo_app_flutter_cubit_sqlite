import 'package:bloc_studies/theme/app_colors.dart';
import 'package:bloc_studies/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  primary: AppColors.accentColorLight,
  onPrimary: AppColors.secondaryColorLight,
  elevation: 1,
  textStyle: AppTextStyle.smallButtomText,
);

const iconThemeAppBar = IconThemeData(color: AppColors.secondaryColorLight);

class TodosAppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColorLight: AppColors.primaryColorLight,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accentColorLight),
      appBarTheme: AppBarTheme(
          iconTheme: iconThemeAppBar,
          actionsIconTheme: iconThemeAppBar,
          color: AppColors.primaryColorLight,
          titleTextStyle: AppTextStyle.smallAppBarText),
      iconTheme: const IconThemeData(color: AppColors.accentColorLight),
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
      snackBarTheme:
          const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    );
  }
}
