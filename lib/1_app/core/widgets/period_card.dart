import 'package:flutter/material.dart';
import 'package:vtop_app/0_data/models/period.dart';

class PeriodCard extends StatelessWidget {
  final Period period;

  const PeriodCard({super.key, required this.period});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                color: theme.colorScheme.secondary,
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
                  color: theme.colorScheme.onSurface,
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
                  color: theme.colorScheme.onSurface,
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
  }

  Widget _gap() => const SizedBox(height: 8);
}
