import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vtop_app/1_app/core/utils/cache_all_data.dart';

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
    return MultiBlocProvider(providers: [
      BlocProvider<HomePageCubit>(
        create: (context) => HomePageCubit()..todaysTimetable(),
      ),
      BlocProvider<HomePageNextPeriodCubit>(
        create: (context) => HomePageNextPeriodCubit()..getNextPeriod(),
      ),
    ], child: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next Class:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () async {
                  BlocProvider.of<HomePageNextPeriodCubit>(context)
                      .emitLoadingState();
                  BlocProvider.of<HomePageCubit>(context).emitLoadingState();
                  await cacheAllData();
                  BlocProvider.of<HomePageNextPeriodCubit>(context)
                      .getNextPeriod();
                  BlocProvider.of<HomePageCubit>(context).todaysTimetable();
                },
                onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    content: Text(
                      'Refresh all data.',
                      style: TextStyle().copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
                child: Icon(
                  Icons.refresh_rounded,
                  size: 30,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
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
        ),
        const SizedBox(height: 8),
        Expanded(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state is HomePageInitial) {
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
