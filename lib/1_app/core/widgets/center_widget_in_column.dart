import 'package:flutter/material.dart';

class CenterWidgetInColumn extends StatelessWidget {
  final Widget child;

  const CenterWidgetInColumn({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
        ],
      ),
    );
  }
}
