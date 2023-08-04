import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vtop_app/1_app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vtop_app/1_app/core/widgets/holiday.dart';
import 'package:vtop_app/1_app/core/widgets/period_list.dart';

import 'cubit/day_cubit.dart';
import 'cubit/timetable_cubit.dart';

final List<String> days = [
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];

class TimetablePageProvider extends StatelessWidget {
  const TimetablePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<DayCubit>(
        create: (context) => DayCubit(),
      ),
      BlocProvider<TimetableCubit>(
        create: (context) => TimetableCubit()..todayTimeTable(),
      ),
    ], child: const TimetablePage());
  }
}

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        title: const Text('Timetable'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: BlocBuilder<DayCubit, String>(
                builder: (context, state) => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<DayCubit>(context)
                              .setDay(days[index]);
                          BlocProvider.of<TimetableCubit>(context)
                              .timetableByDay(days[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: theme.colorScheme.primaryContainer,
                            border: Border.all(
                              strokeAlign: BorderSide.strokeAlignInside,
                              width: 1,
                              color: state == days[index]
                                  ? theme.colorScheme.primary
                                  : Colors.transparent,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            child: Text(
                              days[index],
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: BlocBuilder<TimetableCubit, TimetableState>(
                  builder: (context, state) {
                    if (state is TimetableLoading) {
                      return const CenteredCircularProgressBar();
                    } else if (state is TimetablePeriods) {
                      return SingleChildScrollView(
                        child: PeriodsList(periods: state.periods),
                      );
                    } else if (state is TimetableHoliday) {
                      return const Holiday();
                    } else {
                      return const Placeholder();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
