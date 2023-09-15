import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vitalize/data/models/attendance.dart';

class AttendanceDetailSummaryCard extends StatelessWidget {
  final Attendance attendance;
  const AttendanceDetailSummaryCard({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularPercentIndicator(
                  radius: 30,
                  progressColor: Theme.of(context).colorScheme.primary,
                  percent: double.parse(attendance.attendancePercentage) / 100,
                  center: Text(
                    '${attendance.attendancePercentage}%',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Attendance\nPercentage',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                Text(
                  attendance.totalClasses,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Attended',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                Text(
                  attendance.attendedClasses,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
