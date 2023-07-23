import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vtop_app/1_app/core/routes/go_route_config.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  final int index;
  final String title;

  ScaffoldWithNavbar({
    super.key,
    required GoRouterConfig page,
  })  : index = allNavBarConfigs.indexWhere((element) => element == page),
        title = page.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: allNavBarConfigs[index].child,
      )),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        animationDuration: const Duration(seconds: 1),
        selectedIndex: index,
        onDestinationSelected: (index) {
          context.goNamed(allNavBarConfigs[index].name);
        },
        destinations: _navBarItems,
      ),
    );
  }
}

List<NavigationDestination> _navBarItems = [
  for (var item in allNavBarConfigs)
    NavigationDestination(
        icon: Icon(item.icon),
        selectedIcon: Icon(item.selectedIcon),
        label: item.name)
];
