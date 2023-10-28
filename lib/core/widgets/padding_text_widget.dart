import 'package:flutter/cupertino.dart';

class PaddingTextWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final double leftPadding;
  final double rightPadding;
  final double bottomPadding;
  final double topPadding;
  const PaddingTextWidget(
    {
      required this.text,
      this.textSize = 12,
      this.fontWeight = FontWeight.normal,
      this.maxLines = 1,
      this.textOverflow = TextOverflow.ellipsis,
      this.leftPadding = 8,
      this.rightPadding = 8,
      this.bottomPadding = 8,
      this.topPadding = 8,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding, bottom: bottomPadding, top: topPadding),
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
        overflow: textOverflow,
        maxLines: maxLines,
      ),
    );
  }
}