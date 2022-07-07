import 'package:flutter/cupertino.dart';

class AppColors{
  static Color primary = HexColor.fromHex('#9EB23B');
  static Color darkGrey = HexColor.fromHex('#63666A');
  static Color grey = HexColor.fromHex('#808080');
  static Color lightGrey = HexColor.fromHex('#D3D3D3');


}
extension HexColor on Color{
  static Color fromHex(String stringCode ){
    stringCode = stringCode.replaceAll('#', "");
    if (stringCode.length == 6){
      stringCode = 'FF'+stringCode;
    }
    return Color(int.parse(stringCode,radix: 16));
  }
}