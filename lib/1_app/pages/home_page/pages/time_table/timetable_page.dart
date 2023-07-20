import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vtop_app/1_app/pages/home_page/pages/time_table/cubit/timetable_cubit.dart';
import 'package:vtop_app/1_app/pages/home_page/pages/time_table/view_state_widget.dart';

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
    return BlocProvider(
      create: (context) => TimetableCubit(),
      child: const TimetablePage(),
    );
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
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    GestureDetector(
                      onTap: () => BlocProvider.of<TimetableCubit>(context)
                          .dayTimeTable(days[index]),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: theme.colorScheme.primaryContainer,
                          border: Border.all(
                            strokeAlign: BorderSide.strokeAlignInside,
                            width: 1,
                            color: theme.colorScheme.primary,
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
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: BlocBuilder<TimetableCubit, TimetableState>(
                  builder: (context, state) {
                    if (state is TimetableLoading) {
                      return const TimetableLoadingState();
                    } else if (state is TimetableLoaded) {
                      return TimetableLoadedState(periods: state.periods);
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
