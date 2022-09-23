import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'fonts_manager.dart';


TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.getFont('${FontConstants.fontFamily}',
    textStyle: TextStyle(
      fontSize: fontSize,fontWeight:fontWeight,color: color
    )
  );
}

// regular style
TextStyle getRegularStyle({required double fontSize , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

//light
TextStyle getLightStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
} 

// meduim style
TextStyle getMeduimStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.meduim, color);
}

// bold style
TextStyle getBoldStyle({required double fontSize , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
