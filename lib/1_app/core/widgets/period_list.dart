import 'package:flutter/material.dart';

import '../../../0_data/models/period.dart';

class PeriodsList extends StatelessWidget {
  final List<Period> periods;

  const PeriodsList({Key? key, required this.periods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      itemCount: periods.length,
      itemBuilder: (context, index) {
        final period = periods[index];
        final colorScheme = Theme.of(context).colorScheme;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  period.name,
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _gap(),
                Text(
                  '${period.code} - ${period.slot}',
                  style: theme.textTheme.bodySmall,
                ),
                _gap(),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 18,
                      color: colorScheme.onSurface,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      period.location,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                _gap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.alarm,
                      size: 18,
                      color: colorScheme.onSurface,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${period.startTime} - ${period.endTime}',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _gap() => const SizedBox(height: 8);
}
