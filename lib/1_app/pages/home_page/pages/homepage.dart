import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vtop_app/1_app/core/routes/go_route_config.dart';
import 'package:vtop_app/1_app/pages/home_page/widgets/period_list.dart';

import '../../../../0_data/models/period.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Period period = Period(
        name: 'Maths',
        code: 'MAT1102',
        slot: 'SA1',
        location: 'AB-1 G02',
        startTime: '14:00',
        endTime: '14:50');

    final List<Period> periods = [period, period, period, period];

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
            child: PeriodsList(
          periods: periods,
        )),
      ],
    );
  }
}
