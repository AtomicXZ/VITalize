import 'package:flutter/material.dart';

class CenterWidgetInColumn extends StatelessWidget {
  final Widget child;
  final double customHeight;

  const CenterWidgetInColumn(
      {super.key, required this.child, this.customHeight = 0.8});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * customHeight,
      width: double.infinity,
      child: Center(
        child: child,
      ),
    );
  }
}
