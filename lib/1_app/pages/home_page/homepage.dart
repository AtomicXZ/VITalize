import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/holiday.dart';
import 'cubit/homepage_cubit.dart';
import '../../core/routes/go_route_config.dart';
import '../../core/widgets/circular_progess_indicator.dart';
import '../../core/widgets/period_list.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..todayTimetable(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today\'s Periods:',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(timetablePageConfig.name);
              },
              child: const Text(
                'See all',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state is HomePageInitial || state is HomePageLoading) {
                return const CircularProgress();
              } else if (state is HomePagePeriods) {
                return PeriodsList(periods: state.periods);
              } else if (state is HomePageHoliday) {
                return const Holiday();
              } else {
                return const Placeholder();
              }
            },
          ),
        ),
      ],
    );
  }
}
