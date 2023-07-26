import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vtop_app/0_data/models/attendance.dart';

class AttendanceCard extends StatelessWidget {
  final Attendance attendance;

  const AttendanceCard({super.key, required this.attendance});

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
              attendance.name,
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
            ),
            _gap(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${attendance.type} - ${attendance.slot}',
                      style: theme.textTheme.bodyMedium,
                    ),
                    _gap(),
                    Text(
                      'Total Classes: ${attendance.totalClasses}',
                      style: theme.textTheme.bodySmall,
                    ),
                    Text(
                      'Attended Classes: ${attendance.attendedClasses}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircularPercentIndicator(
                      radius: 22,
                      progressColor: theme.colorScheme.primary.withOpacity(0.8),
                      percent:
                          double.parse(attendance.attendancePercentage) / 100,
                      center: Text(
                        '${attendance.attendancePercentage}%',
                        style: const TextStyle().copyWith(fontSize: 12),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 8)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 4);
}
