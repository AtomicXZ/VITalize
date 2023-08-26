import 'package:flutter/material.dart';
import 'package:vitalize/app/core/routes/go_route_config.dart';

class ScaffoldWithAppbar extends StatelessWidget {
  final GoRouterConfig page;
  final String? title;

  const ScaffoldWithAppbar({super.key, required this.page, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? page.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: page.child,
        ),
      ),
    );
  }
}
