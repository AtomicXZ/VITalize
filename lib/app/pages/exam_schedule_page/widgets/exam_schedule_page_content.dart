import 'package:flutter/material.dart';
import 'package:vitalize/app/pages/exam_schedule_page/widgets/exam_schedule_card_list.dart';
import 'package:vitalize/app/core/extensions/string_extension.dart';

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
            splashBorderRadius: BorderRadius.circular(80),
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              color:
                  Theme.of(context).colorScheme.inversePrimary.withOpacity(0.4),
            ),
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
                  ExamScheduleCardList(subject),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
