import 'package:flutter/material.dart';
import 'package:pips_flutter/presentation//resources/color_manager.dart';
import 'package:pips_flutter/presentation//resources/font_manager.dart';
import 'package:pips_flutter/presentation//resources/styles_manager.dart';
import 'package:pips_flutter/presentation//resources/values_manager.dart';

ThemeData getApplicationTheme() {
  //
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    // ripple color
    splashColor: ColorManager.primaryOpacity70,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
    // card theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    // app bar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),
    // button
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    // text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
      subtitle1: getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ),
      subtitle2: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      caption: getRegularStyle(
        color: ColorManager.grey1,
      ),
      bodyText1: getRegularStyle(
        color: ColorManager.grey,
      ),
    ),
    // input decoration
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p16),
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.grey,
      ),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightGrey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      suffixIconColor: ColorManager.lightGrey,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedLabelStyle: TextStyle(fontSize: FontSize.s10),
      selectedLabelStyle: TextStyle(fontSize: FontSize.s10),
    ),
    navigationRailTheme: NavigationRailThemeData(
      selectedIconTheme: IconThemeData(color: ColorManager.primary),
      unselectedIconTheme: IconThemeData(color: ColorManager.grey1),
    ),
  );
}
