import 'package:flutter/material.dart';

class AttendanceDetailCard extends StatelessWidget {
  final MapEntry attendanceDetail;

  const AttendanceDetailCard({super.key, required this.attendanceDetail});

  @override
  Widget build(BuildContext context) {
    Map attendanceData = attendanceDetail.value as Map;
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Center(
                    child: Text(
                      attendanceDetail.key.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  attendanceData['date'].toString().replaceAll('-', ' '),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  attendanceData['time'].toString().replaceFirst(',', ', '),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14),
                ),
                Text(
                  attendanceData['status'].toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color:
                          _getStatusColor(attendanceData['status'], context)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status, BuildContext context) {
    switch (status) {
      case 'Present':
        return Theme.of(context).colorScheme.primary;
      case 'Absent':
        return Theme.of(context).colorScheme.error;
      default:
        return Colors.grey;
    }
  }
}
