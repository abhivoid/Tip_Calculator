import 'package:flutter/material.dart';

class HexColor extends Color{
  static int _getColorFromHex(String hecColor){
    hecColor=hecColor.toUpperCase().replaceAll("#", "");
    if(hecColor.length==6){
      hecColor="FF"+hecColor;
    }
    return int.parse(hecColor,radix: 16);
    
  }
  HexColor(final String hecColor): super(_getColorFromHex(hecColor));
}

// How to use:
//     Color color1=HexColor("b74093");