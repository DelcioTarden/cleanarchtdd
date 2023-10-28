import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {

  final Color? color;
  final double strokeWidth;
  final double radius;

  const ProgressIndicatorWidget({this.color, this.strokeWidth = 2, this.radius = 28, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return circularProgressIndicator(context: context, cor: color, stroke: strokeWidth, rad: radius);
  }

  Widget circularProgressIndicator({@required BuildContext? context, Color? cor, double? stroke, double? rad}) {
    var circularProgress = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color ?? Theme.of(context!).textTheme.bodyMedium!.color!,),
      strokeWidth: strokeWidth,
    );
    if (radius == 0){
      return circularProgress;
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: radius,
        width: radius,
        child: circularProgress,
      );
    }
  }
}