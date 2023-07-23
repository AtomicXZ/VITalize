import 'package:flutter/material.dart';

class Holiday extends StatelessWidget {
  const Holiday({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'No classes today!',
          ),
        ),
      ],
    );
  }
}
