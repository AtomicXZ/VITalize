import 'package:flutter/material.dart';
import 'package:vitalize/data/models/marks.dart';

class MarksCard extends StatelessWidget {
  final Marks subject;

  const MarksCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            collapsedIconColor: theme.colorScheme.secondary,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.name,
                  style: const TextStyle().copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${subject.type} - ${subject.slot}',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  subject.professor,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            children: [
              for (var entry in subject.marks.entries)
                ListTile(
                  title: Text(entry.key, style: theme.textTheme.bodyMedium),
                  trailing: Text(
                      '${entry.value['scoredMarks']!}/${entry.value['maxMarks']!} - ${entry.value['scoredWeightageMarks']!}/${entry.value['maxWeightageMarks']!}',
                      style: theme.textTheme.bodyMedium),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: theme.colorScheme.primary,
                ),
              ),
              ListTile(
                title: Text('Total', style: theme.textTheme.bodyMedium),
                trailing: Text(_getTotal, style: theme.textTheme.bodyMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get _getTotal {
    double sumScored = 0;
    double sumTotal = 0;

    for (var entry in subject.marks.entries) {
      sumScored += double.parse(entry.value['scoredWeightageMarks']!);
      sumTotal += double.parse(entry.value['maxWeightageMarks']!);
    }

    return '$sumScored / $sumTotal';
  }
}
