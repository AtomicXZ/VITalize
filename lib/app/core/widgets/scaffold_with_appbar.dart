import 'package:flutter/material.dart';
import 'package:vitalize/app/core/routes/go_route_config.dart';

class ScaffoldWithAppbar extends StatelessWidget {
  final GoRouterConfig page;
  final String? title;
  final Widget? child;

  const ScaffoldWithAppbar(
      {super.key, required this.page, this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? page.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: child ?? page.child,
        ),
      ),
    );
  }
}
