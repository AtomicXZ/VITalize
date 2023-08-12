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
        child: Column(
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
            _gap(),
            Text(
              '${subject.type} - ${subject.slot}',
              style: theme.textTheme.bodySmall,
            ),
            Text(
              subject.professor,
              style: theme.textTheme.bodySmall,
            ),
            _gap(),
            const Divider(),
            for (var entry in subject.marks.entries)
              ListTile(
                title: Text(entry.key, style: theme.textTheme.bodyMedium),
                trailing: Text(
                    '${entry.value['scoredMarks']!}/${entry.value['maxMarks']!} - ${entry.value['scoredWeightageMarks']!}/${entry.value['maxWeightageMarks']!}',
                    style: theme.textTheme.bodyMedium),
              ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 8);
}
