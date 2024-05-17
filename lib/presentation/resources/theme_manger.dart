import 'package:advanced_app/presentation/resources/color_manger.dart';
import 'package:advanced_app/presentation/resources/font_manger.dart';
import 'package:advanced_app/presentation/resources/styles_manger.dart';
import 'package:advanced_app/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManger.primary,
    primaryColorLight: ColorManger.lightPrimary,
    primaryColorDark: ColorManger.darkPrimary,
    disabledColor: ColorManger.grey1,
    splashColor: ColorManger.lightPrimary,
    cardTheme: CardTheme(
      color: ColorManger.white,
      shadowColor: ColorManger.gery,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManger.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManger.lightPrimary,
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManger.white,
      ),
    ),
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManger.grey1,
        buttonColor: ColorManger.primary,
        splashColor: ColorManger.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManger.white,
          fontSize: FontSize.s18,
        ),
        backgroundColor: ColorManger.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManger.darkGrey, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: ColorManger.darkGrey, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: ColorManger.darkGrey, fontSize: FontSize.s14),
        titleMedium:
            getMeduimStyle(color: ColorManger.primary, fontSize: FontSize.s16),
        titleSmall:
            getRegularStyle(color: ColorManger.white, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorManger.grey1),
        bodySmall: getRegularStyle(color: ColorManger.gery),
        bodyMedium:
            getRegularStyle(color: ColorManger.grey2, fontSize: FontSize.s12),
        labelSmall:
            getBoldStyle(color: ColorManger.primary, fontSize: FontSize.s12)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorManger.grey1, fontSize: FontSize.s14),
        labelStyle:
            getMeduimStyle(color: ColorManger.gery, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManger.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManger.gery, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManger.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
  );
}
