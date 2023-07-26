import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:vtop_app/1_app/core/widgets/holiday.dart';
import 'package:vtop_app/1_app/core/widgets/period_card.dart';
import 'package:vtop_app/1_app/pages/home_page/cubit/home_page_next_period_cubit.dart';
import 'package:vtop_app/1_app/pages/home_page/cubit/homepage_cubit.dart';
import 'package:vtop_app/1_app/core/routes/go_route_config.dart';
import 'package:vtop_app/1_app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vtop_app/1_app/core/widgets/period_list.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..todaysTimetable(),
      child: BlocProvider(
        create: (context) => HomePageNextPeriodCubit()..getNextPeriod(),
        child: const HomePage(),
      ),
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
        Text(
          'Next Class:',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 148,
          child: BlocBuilder<HomePageNextPeriodCubit, HomePageNextPeriodState>(
              builder: (context, state) {
            if (state is HomePageNextPeriodInitial) {
              return const CenteredCircularProgressBar();
            } else if (state is HomePageNextPeriod) {
              return PeriodCard(period: state.period);
            } else if (state is HomePageNoNextPeriod ||
                state is HomePageNextPeriodHoliday) {
              return Center(
                child: Text(
                  'No upcoming class today.',
                  style: const TextStyle().copyWith(fontSize: 16),
                ),
              );
            } else {
              return const Placeholder();
            }
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today\'s Classes:',
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
        const SizedBox(height: 8),
        Expanded(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state is HomePageInitial || state is HomePageLoading) {
                return const CenteredCircularProgressBar();
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
