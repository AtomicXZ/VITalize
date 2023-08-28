import 'package:easy_refresh/easy_refresh.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vitalize/app/core/routes/go_route_config.dart';
import 'package:vitalize/app/core/utils/cache_all_data.dart';
import 'package:vitalize/app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vitalize/app/core/widgets/period_card.dart';
import 'package:vitalize/app/core/widgets/period_list.dart';
import 'package:vitalize/app/pages/home_page/cubit/home_page_next_period_cubit.dart';
import 'package:vitalize/app/pages/home_page/cubit/homepage_cubit.dart';

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
    return EasyRefresh(
      onRefresh: () async {
        BlocProvider.of<HomePageNextPeriodCubit>(context).emitLoadingState();
        BlocProvider.of<HomePageCubit>(context).emitLoadingState();
        await cacheAllData();
        BlocProvider.of<HomePageNextPeriodCubit>(context).getNextPeriod();
        BlocProvider.of<HomePageCubit>(context).todaysTimetable();
      },
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Next Class',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                Tooltip(
                  message: 'Refresh all data',
                  child: IconButton(
                    onPressed: () async {
                      BlocProvider.of<HomePageNextPeriodCubit>(context)
                          .emitLoadingState();
                      BlocProvider.of<HomePageCubit>(context)
                          .emitLoadingState();
                      await cacheAllData();
                      BlocProvider.of<HomePageNextPeriodCubit>(context)
                          .getNextPeriod();
                      BlocProvider.of<HomePageCubit>(context).todaysTimetable();
                    },
                    icon: Icon(
                      FluentIcons.arrow_circle_down_32_filled,
                      size: 30,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 126,
            child:
                BlocBuilder<HomePageNextPeriodCubit, HomePageNextPeriodState>(
                    builder: (context, state) {
              if (state is HomePageNextPeriodInitial) {
                return const CenteredCircularProgressBar();
              } else if (state is HomePageNextPeriod) {
                return PeriodCard(period: state.period, isNextPeriodTile: true);
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
                BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (context, state) {
                    return Text(
                      '${state.header}\'s Classes',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                    );
                  },
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
          BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state is HomePageInitial) {
                return const Column(
                  children: [
                    SizedBox(
                      height: 175,
                    ),
                    CircularProgressIndicator(),
                  ],
                );
              } else if (state is HomePagePeriods) {
                return PeriodsList(periods: state.periods);
              } else {
                return const Placeholder();
              }
            },
          ),
        ],
      ),
    );
  }
}
