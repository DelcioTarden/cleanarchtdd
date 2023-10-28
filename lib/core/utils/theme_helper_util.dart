import 'package:flutter/material.dart';

class ThemeHelper { 

  static final ThemeHelper _aparenciaHelper = ThemeHelper._internal();
  static ThemeHelper get instance { return _aparenciaHelper; }
  ThemeHelper._internal();

  // Color get colorPrincipal { return Color.fromRGBO(24, 24, 222, 1); }
  Color get colorPrincipal { return Colors.blue[700]!; }
  Color get colorSecundary { return Colors.red; }
  Color get colorGradientStart { return const Color.fromRGBO(27, 27, 244, 1); }
  Color get colorGradientEnd { return const Color.fromRGBO(16, 16, 145, 1); }

  Color get colorWarning { return Colors.orange.shade600; }
  Color get colorSuccess { return Colors.green; }
  Color get colorFalha { return Colors.redAccent; }
  Color get colorBlueGrey { return Colors.blueGrey; }
  Color get colorBackgroundGrey { return Colors.grey.shade200; }
  Color get colorDark { return Colors.black87; }

  // TextTheme get textTheme {
  //   return Theme.of(AppService.instance.context).textTheme;
  // }

  ThemeData get themeData {
    return classic;
  }

  ThemeData get classic {
    final disabledColor = Colors.grey.shade600;
    return ThemeData(
      primaryColor: Colors.white,
      indicatorColor: colorSecundary,
      textSelectionTheme: TextSelectionThemeData(cursorColor: colorSecundary),
      scaffoldBackgroundColor: Colors.white,
      disabledColor: disabledColor,
      cardColor: Colors.white,
      dividerColor: Colors.black26,
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
      ),
      unselectedWidgetColor: Colors.white,
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          color: Colors.black87,
        ),
        bodyMedium: TextStyle(
          color: Colors.black87,
        ),
        titleLarge: TextStyle(
          color: Colors.black54,
        ),
        labelSmall: TextStyle(
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black87,
      ),
      buttonTheme: ButtonThemeData(
        height: 44,
        buttonColor: colorPrincipal,
        disabledColor: disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(
        color: Colors.white,
        textStyle: TextStyle(
          color: Colors.black87,
          fontSize: 13,
        )
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.blue[700]),
        color: colorPrincipal,
        elevation: 0,
      ), colorScheme: ColorScheme(background: Colors.white, brightness: Brightness.light, primary: colorPrincipal, onPrimary: colorPrincipal, secondary: colorSecundary, onSecondary: colorSecundary, error: colorWarning, onError: colorFalha, onBackground: colorBackgroundGrey, surface: colorBlueGrey, onSurface: colorBlueGrey),
    );
  }
}