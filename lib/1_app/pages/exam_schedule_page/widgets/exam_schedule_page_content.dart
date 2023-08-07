import 'package:flutter/material.dart';
import 'package:vtop_app/1_app/pages/exam_schedule_page/widgets/exam_schedule_card.dart';
import 'package:vtop_app/1_app/core/extensions/string_extension.dart';

class ExamSchedulePageContent extends StatelessWidget {
  final Map examSchedule;

  const ExamSchedulePageContent({super.key, required this.examSchedule});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: examSchedule.length,
      child: Column(
        children: [
          TabBar(
            labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
            unselectedLabelColor: Theme.of(context).colorScheme.secondary,
            indicatorColor: Theme.of(context).colorScheme.inversePrimary,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              for (var text in examSchedule.keys)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text((text as String).capitalize()),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              children: [
                for (var subject in examSchedule.values)
                  ExamScheduleCard(subject),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
