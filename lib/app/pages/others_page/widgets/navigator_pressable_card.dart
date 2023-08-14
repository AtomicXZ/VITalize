import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitalize/app/core/routes/go_route_config.dart';

class NavigatorPressableCard extends StatelessWidget {
  final GoRouterConfig page;
  final String title;
  final String subtitle;

  const NavigatorPressableCard({
    super.key,
    required this.page,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () => context.pushNamed(page.name),
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          leading: Icon(page.icon ?? FluentIcons.info_24_filled),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
