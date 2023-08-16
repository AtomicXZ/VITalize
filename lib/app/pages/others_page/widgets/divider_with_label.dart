import 'package:flutter/material.dart';

class DividerWithLabel extends StatelessWidget {
  final String label;

  const DividerWithLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Divider(
            color: Theme.of(context).colorScheme.secondary,
          )),
        ],
      ),
    );
  }
}
