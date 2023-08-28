import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:vitalize/app/core/routes/go_route_config.dart';
import 'package:vitalize/app/core/widgets/animated_column.dart';
import 'package:vitalize/app/pages/others_page/widgets/divider_with_label.dart';
import 'package:vitalize/app/pages/others_page/widgets/hostel_wifi_card.dart';
import 'package:vitalize/app/pages/others_page/widgets/navigator_pressable_card.dart';
import 'package:vitalize/data/utils/hive_box_utils.dart';

class OthersPage extends StatelessWidget {
  const OthersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
          _gap,
          const DividerWithLabel(label: 'Academics'),
          _gap,
          NavigatorPressableCard(
            page: profilePageConfig,
            title: 'Profile',
            subtitle: 'University details.',
          ),
          NavigatorPressableCard(
            page: examSchedulePageConfig,
            title: 'Exam Schedule',
            subtitle: 'Exam Schedule for current semester.',
          ),
          NavigatorPressableCard(
            page: settingsPageConfig,
            title: 'Settings',
            subtitle: 'Customize the app settings.',
          ),
          _gap,
          const DividerWithLabel(label: 'Utils'),
          _gap,
          const HostelWifiCard(),
        ],
      ),
    );
  }

  Widget get _gap => const SizedBox(height: 8);
}
