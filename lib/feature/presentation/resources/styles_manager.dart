import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/feature/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize,Color color,FontWeight fontWeight)
{
  return GoogleFonts.inter(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight
  );
}
// Regular Style
TextStyle getRegularStyle({double fontSize = FontSize.s12,required Color color })
{
  return _getTextStyle(fontSize, color, FontWeightManager.regular);
}

// medium Style
TextStyle getMediumStyle({double fontSize = FontSize.s12,required Color color })
{
  return _getTextStyle(fontSize, color, FontWeightManager.medium);
}

// Light Style
TextStyle getLightStyle({double fontSize = FontSize.s12,required Color color })
{
  return _getTextStyle(fontSize, color, FontWeightManager.light);
}
// semiBold Style
TextStyle getSemiBoldStyle({double fontSize = FontSize.s12,required Color color })
{
  return _getTextStyle(fontSize, color, FontWeightManager.semiBold);
}