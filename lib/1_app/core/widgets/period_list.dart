import 'package:flutter/material.dart';

import 'package:vtop_app/0_data/models/period.dart';
import 'package:vtop_app/1_app/core/widgets/period_card.dart';

class PeriodsList extends StatelessWidget {
  final List<Period> periods;

  const PeriodsList({Key? key, required this.periods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (Period period in periods) PeriodCard(period: period),
      ],
    );
  }
}
