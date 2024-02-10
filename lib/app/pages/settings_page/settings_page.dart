import 'package:flutter/material.dart';
import 'package:vitalize/app/core/widgets/animated_column.dart';
import 'package:vitalize/app/pages/settings_page/widgets/notifications_card.dart';
import 'package:vitalize/app/pages/settings_page/widgets/rebuild_boxes_card.dart';
import 'package:vitalize/app/pages/settings_page/widgets/theme_cards.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AnimatedColumn(
        children: [
          ThemeCards(),
          NotificationsCard(),
          RebuildBoxesCardProvider(),
        ],
      ),
    );
  }
}
