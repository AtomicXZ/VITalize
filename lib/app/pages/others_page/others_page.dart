import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitalize/app/core/routes/go_route_config.dart';
import 'package:vitalize/app/core/widgets/animated_column.dart';
import 'package:vitalize/app/pages/others_page/widgets/navigator_pressable_card.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

class OthersPage extends StatelessWidget {
  const OthersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedColumn(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              emptyAllBoxes();
              context.goNamed(loginPageConfig.name);
            },
            child: const Text('Logout'),
          ),
          const SizedBox(
            height: 16,
          ),
          NavigatorPressableCard(
              page: profilePageConfig,
              title: 'Profile',
              subtitle: 'University details.'),
          NavigatorPressableCard(
              page: examSchedulePageConfig,
              title: 'Exam Schedule',
              subtitle: 'Exam Schedule for current semester.'),
        ],
      ),
    );
  }
}
