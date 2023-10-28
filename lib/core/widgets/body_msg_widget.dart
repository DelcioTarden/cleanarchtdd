import 'package:flutter/material.dart';
import 'package:path/path.dart';

class BodyMsgWidget extends StatelessWidget {

  final String? msg;
  final Color? color;
  final EdgeInsets? padding;
  final bool exibirIconWarning;
  final Widget? iconCenter;
  final num heightContainer;

  const BodyMsgWidget({
    @required this.msg,
    this.color,
    this.padding,
    this.exibirIconWarning = true,
    this.iconCenter,
    this.heightContainer = 0.3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: padding ?? const EdgeInsets.all(0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildIconWarning(context),
            _buildMsg(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWarning(BuildContext context) {
    if (exibirIconWarning) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * heightContainer,
        child: Image.asset(join('assets', 'img-not-found.png'), fit: BoxFit.fill,),
      );
    }
    return iconCenter ?? const SizedBox.shrink();
  }

  Widget _buildMsg(BuildContext context) {
    return Text(
      msg.toString(),
      style: TextStyle(
        color: color ?? Colors.black87,
        fontSize: 14.5,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
