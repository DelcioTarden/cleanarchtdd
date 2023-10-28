import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ShowTopSnackBarHelper {
  static void showCustomTopSnackBar(int snackType, String msg, BuildContext context) {
    if(snackType == 1) {
      return showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: msg,
        ),
      );
    } else if(snackType == 2) {
      return showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: msg,
        ),
      );
    } else if(snackType == 3) {
      return showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: msg,
        ),
      );
    }
  }
}