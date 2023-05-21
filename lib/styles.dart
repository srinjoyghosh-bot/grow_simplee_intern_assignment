import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/size_config.dart';

TextStyle buttonTextStyle = TextStyle(
      fontSize: SizeConfig.blockSizeVertical * 2.5,
      fontWeight: FontWeight.bold,
    ),
    buttonTextStyle2 = TextStyle(
      fontSize: SizeConfig.blockSizeVertical * 2.2,
    ),
    headerTextStyle1 = TextStyle(
      fontSize: SizeConfig.blockSizeVertical * 2.5,
    ),
    bodyTextStyle1 = TextStyle(
      fontSize: SizeConfig.blockSizeVertical * 2.2,
      fontWeight: FontWeight.w500,
    ),
    bodyTextStyle2 = TextStyle(
      fontSize: SizeConfig.blockSizeVertical * 2.2,
      color: Colors.black.withOpacity(0.65),
    ),
    bodyTextStyle3 = TextStyle(
      fontSize: SizeConfig.blockSizeVertical * 2.2,
      color: Colors.white,
    ),
    bodyTextStyle4 = TextStyle(
      fontSize: SizeConfig.blockSizeVertical * 2.5,
      color: Colors.black,
    );

ThemeData myTheme = ThemeData(
  primarySwatch: Colors.purple,
  textTheme: TextTheme(
    bodySmall: bodyTextStyle1,
    bodyMedium: bodyTextStyle2,
    bodyLarge: bodyTextStyle3,
    displayMedium: bodyTextStyle4,
    displaySmall: buttonTextStyle2,
    titleLarge: headerTextStyle1,
    labelMedium: buttonTextStyle2,
    labelLarge: buttonTextStyle,
  ),
);

// Color greyText= Colors.black.withOpacity(0.65);
