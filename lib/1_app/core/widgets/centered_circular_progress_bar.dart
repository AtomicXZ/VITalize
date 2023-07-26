import 'package:flutter/material.dart';

class CenteredCircularProgressBar extends StatelessWidget {
  const CenteredCircularProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
