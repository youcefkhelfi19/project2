import 'package:flutter/material.dart';
import 'package:project2/presentation/helper/app_colors.dart';
import 'package:project2/presentation/helper/app_fonts.dart';
import 'package:project2/presentation/helper/app_text_styles.dart';
import 'package:project2/presentation/helper/app_values.dart';

ThemeData appTheme (){
  return ThemeData(
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primary,
    primaryColorDark: AppColors.darkGrey,
    disabledColor: AppColors.lightGrey,
  //  splashColor:  AppColors.primary.withOpacity(70),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.grey),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: AppSize.s12,
      shadowColor: AppColors.lightGrey,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color:  AppColors.primary,
      centerTitle: true,
      titleTextStyle: regularStyle(color: Colors.white,size: FontSize.s18),
      
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppSize.s12)
  ),
      disabledColor: AppColors.lightGrey,
      buttonColor: AppColors.primary,
      //splashColor: AppColors.primary.withOpacity(70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: regularStyle(color: Colors.white),
        primary: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)
        )
      ),
    ),
    textTheme: TextTheme(
      headline1: semiBoldStyle(color: AppColors.darkGrey,size: FontSize.s18),
      subtitle1: mediumStyle(color: AppColors.lightGrey,size: FontSize.s14),
      caption: regularStyle(color: AppColors.grey,),
      bodyText1:  regularStyle(color: AppColors.grey,),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppSize.s8),
      hintStyle: regularStyle(color: AppColors.lightGrey),
      labelStyle: regularStyle(color: AppColors.grey),
      errorStyle: regularStyle(color: Colors.red) ,
      enabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSize.s1,
          color: AppColors.grey
        ),
        borderRadius: BorderRadius.circular(AppSize.s18)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: AppSize.s1,
              color: Colors.red
          ),
          borderRadius: BorderRadius.circular(AppSize.s18)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: AppSize.s1,
              color: AppColors.primary
          ),
          borderRadius: BorderRadius.circular(AppSize.s18)
      ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: AppSize.s1,
                color: AppColors.primary
            ),
            borderRadius: BorderRadius.circular(AppSize.s18)
        )
    )
  );
}