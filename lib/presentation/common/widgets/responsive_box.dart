import 'package:flutter/material.dart';

class ResponsiveBox extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final double maxHeight;

  const ResponsiveBox(
      {required this.child,
      this.maxWidth = 600,
      this.maxHeight = 400,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width:
            constraints.maxWidth > maxWidth ? maxWidth : constraints.maxWidth,
        height: constraints.maxHeight > maxHeight
            ? maxHeight
            : constraints.maxHeight,
        child: child,
      );
    });
  }
}
