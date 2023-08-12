import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vitalize/app/pages/exam_schedule_page/cubit/exam_schedule_cubit.dart';
import 'package:vitalize/app/pages/exam_schedule_page/widgets/exam_schedule_page_content.dart';

class ExamSchedulePageProvider extends StatelessWidget {
  const ExamSchedulePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamScheduleCubit()..getExamSchedule(),
      child: const ExamSchedulePage(),
    );
  }
}

class ExamSchedulePage extends StatelessWidget {
  const ExamSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamScheduleCubit, ExamScheduleState>(
        builder: (context, state) {
      if (state is ExamScheduleInitial) {
        return const CenteredCircularProgressBar();
      } else if (state is ExamScheduleNoData) {
        return Center(
            child: Text(
          'No Exams Scheduled for Current Sem.',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        ));
      } else if (state is ExamScheduleLoaded) {
        return ExamSchedulePageContent(examSchedule: state.examSchedule);
      } else {
        return const Placeholder();
      }
    });
  }
}
