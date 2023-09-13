import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/app/core/widgets/center_widget_in_column.dart';
import 'package:vitalize/app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vitalize/app/pages/exam_schedule_page/cubit/exam_schedule_cubit.dart';
import 'package:vitalize/app/pages/exam_schedule_page/widgets/exam_schedule_page_content.dart';

class ExamSchedulePageProvider extends StatelessWidget {
  const ExamSchedulePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamScheduleCubit()..getExamScheduleFromBox(),
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
        return EasyRefresh(
          onRefresh: () async {
            await BlocProvider.of<ExamScheduleCubit>(context)
                .getExamScheduleFromApi();
            return BlocProvider.of<ExamScheduleCubit>(context).responseStatus
                ? IndicatorResult.success
                : IndicatorResult.fail;
          },
          child: ListView(
            children: [
              CenterWidgetInColumn(
                child: Text(
                  'No exam data available.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
        );
      } else if (state is ExamScheduleLoaded) {
        return ExamSchedulePageContent(examSchedule: state.examSchedule);
      } else {
        return const Placeholder();
      }
    });
  }
}
