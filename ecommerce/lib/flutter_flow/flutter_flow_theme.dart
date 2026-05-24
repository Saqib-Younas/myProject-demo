import 'package:flutter/material.dart';

class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return FlutterFlowTheme();
  }

  Color get primary => Colors.blue;
  Color get primary10 => Colors.blue.withOpacity(0.1);
  Color get primary20 => Colors.blue.withOpacity(0.2);
  Color get primary10 => Colors.blue.withOpacity(0.1);
  Color get primaryBackground => Colors.white;
  Color get secondaryBackground => Colors.grey[100]!;
  Color get primaryText => Colors.black;
  Color get secondaryText => Colors.grey[600]!;
  Color get alternate => Colors.grey[300]!;
  Color get tertiary => Colors.blueGrey;
  Color get secondary => Colors.grey[500]!;
  Color get onSecondary => Colors.white;
  Color get onError => Colors.white;
  Color get accent3 => Colors.blueAccent;
  Color get accent10 => Colors.blueAccent.withOpacity(0.1);
  Color get surface80 => Colors.grey[200]!;
  Color get success10 => Colors.green.withOpacity(0.1);
  Color get onSurface => Colors.black87;
  Color get error => Colors.red;
  Color get error15 => Colors.red.withOpacity(0.15);
  Color get error30 => Colors.red.withOpacity(0.3);

  TextStyle get title1 => TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle get title2 => TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get title3 => TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle get subtitle1 => TextStyle(fontSize: 16);
  TextStyle get subtitle2 => TextStyle(fontSize: 14);
  TextStyle get bodyText1 => TextStyle(fontSize: 16);
  TextStyle get bodyText2 => TextStyle(fontSize: 14);
  TextStyle get bodySmall => TextStyle(fontSize: 12);
  TextStyle get titleMedium => TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  TextStyle get labelLarge => TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle get labelMedium => TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  TextStyle get labelSmall => TextStyle(fontSize: 11);
  TextStyle get bodyMedium => TextStyle(fontSize: 14);
  TextStyle get titleLarge => TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  TextStyle get headlineMedium => TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  TextStyle get titleSmall => TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle get bodyLarge => TextStyle(fontSize: 16);

  Color get onPrimary => Colors.white;
  Color get success => Colors.green;
  Color get success15 => Colors.green.withOpacity(0.15);
}

extension TextStyleExtensions on TextStyle {
  TextStyle override({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? lineHeight,
    String? fontFamily,
    TextStyle? font,
  }) {
    return copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      height: lineHeight,
      fontFamily: font?.fontFamily ?? fontFamily,
    );
  }
}