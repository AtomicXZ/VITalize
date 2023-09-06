import 'package:flutter/material.dart';

class CenterWidgetInColumn extends StatelessWidget {
  final Widget child;

  const CenterWidgetInColumn({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      child: Center(
        child: child,
      ),
    );
  }
}
