import 'package:flutter/material.dart';
import 'package:project2/presentation/helper/app_fonts.dart';

TextStyle _getTextStyle(double size, Color color, String  fontFamily,FontWeight weight){
  return TextStyle(fontSize:  size,color: color,fontFamily: fontFamily, fontWeight: weight);
}
TextStyle regularStyle({double size = FontSize.s12,required Color color}){
return _getTextStyle(size, color, FontConstants.fontFamily, FontWeightManager.regular);
}
TextStyle lightStyle({double size = FontSize.s12,required Color color}){
  return _getTextStyle(size, color, FontConstants.fontFamily, FontWeightManager.light);
}
TextStyle mediumStyle({double size = FontSize.s12,required Color color}){
  return _getTextStyle(size, color, FontConstants.fontFamily, FontWeightManager.medium);
}
TextStyle semiBoldStyle({double size = FontSize.s12,required Color color}){
  return _getTextStyle(size, color, FontConstants.fontFamily, FontWeightManager.semiBold);
}
TextStyle boldStyle({double size = FontSize.s12,required Color color}){
  return _getTextStyle(size, color, FontConstants.fontFamily, FontWeightManager.bold);
}