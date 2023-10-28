import 'package:flutter/material.dart';
import 'package:cleanarchtdd/core/utils/theme_helper_util.dart';

class UtilStyle {
  static Color get colorPrincipal { return ThemeHelper.instance.colorPrincipal; }
  
  /// LOGIN
  static TextStyle labelTextStyleLogin() {
    return const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  static TextStyle textFormStyleLogin() {
    return const TextStyle(
      color: Colors.black87,
    );
  }

  static InputBorder borderLogin() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeHelper.instance.themeData.primaryColor,
        style: BorderStyle.none,
      ),
    );
  }

  static InputBorder focusBorderLogin() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeHelper.instance.themeData.primaryColor,
        style: BorderStyle.none,
      ),
    );
  }

  static InputBorder enabledBorderLogin() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black87,
        style: BorderStyle.none,
      ),
    );
  }

  static InputDecoration inputDecorationLogin(String title, Widget suffixIcon) {
    return InputDecoration(
      enabledBorder: UtilStyle.enabledBorderLogin(),
      focusedBorder: UtilStyle.focusBorderLogin(),
      border: UtilStyle.borderLogin(),
      labelText: title,
      labelStyle: UtilStyle.labelTextStyleLogin(),
      suffixIcon: suffixIcon,
      fillColor: Colors.grey.shade200,
      filled: true,
    );
  }

  static InputDecoration inputDecorationTitle(String label, {double fontSize = 12, IconData? prefixIcon, IconData? sufixIcon}) {
    return InputDecoration(
      labelText: label,
      counterText: '',
      labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: fontSize),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue.shade400,),
        borderRadius: BorderRadius.circular(30),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red,),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red,),
        borderRadius: BorderRadius.circular(30),
      ),
      prefixIcon: Icon(prefixIcon, color: ThemeHelper.instance.colorPrincipal),
      //suffixIcon: Icon(sufixIcon),
      errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
    );
  }

  static InputDecoration inputDecorationSquareRounded(String label, {double fontSize = 12, IconData? prefixIcon, IconData? sufixIcon}) {
    return InputDecoration(
      labelText: label,
      counterText: '',
      labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: fontSize),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey.shade100,),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey.shade100,),
        borderRadius: BorderRadius.circular(30),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red,),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red,),
        borderRadius: BorderRadius.circular(30),
      ),
      prefixIcon: Icon(prefixIcon, color: Colors.blue[700]),
      suffixIcon: Icon(sufixIcon),
      errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
    );
  }


  static InputDecoration inputDecorationSquare(String label, {double fontSize = 14, IconData? prefixIcon, IconData? sufixIcon}) {
    return InputDecoration(
      labelText: label,
      alignLabelWithHint: true,
      counterText: '',
      filled: true,
      fillColor: ThemeHelper.instance.colorBackgroundGrey,
      labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: fontSize),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey.shade100,),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey.shade100,),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red,),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red,),
        borderRadius: BorderRadius.circular(10),
      ),
      prefixIcon: (prefixIcon != null) ? Icon(prefixIcon, color: Colors.blue[700]) : null,
      suffixIcon: Icon(sufixIcon),
      errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
    );
  }


  /// GERAL
  static InputDecoration inputDecoration(String label, {String? labelHint, Widget? prefixIcon, Widget? suffixIcon, bool alignLabelWithHint = false, double fontSize = 12}) {
    return InputDecoration(
      labelText: label,
      counterText: '',
      hintText: labelHint,
      alignLabelWithHint: alignLabelWithHint,
      filled: true,
      isDense: true,
      fillColor: ThemeHelper.instance.themeData.textTheme.labelSmall!.color,
      labelStyle: TextStyle(color: Colors.black87, fontSize: fontSize),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeHelper.instance.themeData.disabledColor),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black87),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeHelper.instance.colorPrincipal),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeHelper.instance.themeData.colorScheme.error),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeHelper.instance.themeData.colorScheme.error),
        borderRadius: BorderRadius.circular(10),
      ),
      errorStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffixStyle: const TextStyle(
        color: Colors.red,
      ),
      
    );
  }

  static InputDecoration inputDecorationSemBorda(String label, {String? labelHint, Widget? prefixIcon, Widget? suffixIcon, bool alignLabelWithHint = false, double fontSize = 12}) {
    return InputDecoration(
      labelText: label,
      counterText: '',
      hintText: labelHint,
      alignLabelWithHint: alignLabelWithHint,
      filled: true,
      isDense: true,
      fillColor: ThemeHelper.instance.themeData.textTheme.labelSmall!.color,
      labelStyle: TextStyle(color: ThemeHelper.instance.themeData.disabledColor, fontSize: fontSize),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  static TextStyle textStyleCustom({@required double? fontSize, FontWeight? fontWeight}){
    return TextStyle(
      color: Colors.black87,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize,
    );
  }

  static TextStyle textStyleDialogDefault([double tamanhoFonte = 15]){
    return TextStyle(
      color: Colors.black87,
      fontSize: tamanhoFonte,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStylePacItemHead({Color? color, FontWeight fontWeight = FontWeight.w400, double fontSize = 12}) {
    return TextStyle(
      color: color, 
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static BorderRadius borderRadiusBackground() {
    return const BorderRadius.vertical(
      top: Radius.circular(12),
      bottom: Radius.zero,
    );
  }

  static BoxDecoration boxDecorationContainerInputText(bool exibirBorda, {Color? colorContainer, Color? colorBorder}) {
    return BoxDecoration(
      color: colorContainer ?? ThemeHelper.instance.themeData.cardColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        style: exibirBorda ? BorderStyle.solid : BorderStyle.none,
        color: colorBorder ?? ThemeHelper.instance.themeData.disabledColor,
      ),
    );
  }
}