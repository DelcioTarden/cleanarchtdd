import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  const TextWidget(
    {
      required this.text,
      this.textSize = 12,
      this.fontWeight = FontWeight.normal,
      this.maxLines = 1,
      this.textOverflow = TextOverflow.ellipsis,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}