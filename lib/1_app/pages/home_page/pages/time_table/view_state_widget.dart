import 'package:flutter/material.dart';
import 'package:vtop_app/0_data/models/period.dart';
import 'package:vtop_app/1_app/pages/home_page/widgets/period_list.dart';

class TimetableLoadingState extends StatelessWidget {
  const TimetableLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
      ],
    );
  }
}

class TimetableLoadedState extends StatelessWidget {
  final List<Period> periods;

  const TimetableLoadedState({super.key, required this.periods});

  @override
  Widget build(BuildContext context) {
    return PeriodsList(periods: periods);
  }
}
