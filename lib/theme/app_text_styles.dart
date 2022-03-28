import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static final smallTitle = GoogleFonts.lora(
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 28));
  static final smallSubtitle = GoogleFonts.roboto(
      textStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20));
  static final smallTitleTile = GoogleFonts.roboto(
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17));
  static final smallCompletedTitleTile = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          decoration: TextDecoration.lineThrough));
  static final smallSubtitleTile = GoogleFonts.roboto(
      textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15));
  static final smallBody = GoogleFonts.roboto(
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600));
  static final smallLabel = GoogleFonts.roboto(
      textStyle: const TextStyle(fontSize: 16, height: 1.60));
  static final smallButtomText = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.75));
  static final smallAppBarText = GoogleFonts.roboto(
      textStyle: const TextStyle(
          color: AppColors.secondaryColorLight,
          fontWeight: FontWeight.bold,
          fontSize: 16));
}
