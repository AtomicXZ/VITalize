import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:vitalize/app/core/theme/vitalise_theme.dart';
import 'package:vitalize/app/core/utils/hive_user_box_utils.dart';

class ThemeCards extends StatefulWidget {
  const ThemeCards({super.key});

  @override
  State<ThemeCards> createState() => _ThemeCardsState();
}

class _ThemeCardsState extends State<ThemeCards> {
  late bool _dynamicTheme;

  @override
  void initState() {
    _dynamicTheme = isTrue(dynamicTheme);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: _toggleDynamicTheme,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(FluentIcons.color_24_regular),
                title: const Text('Use dynamic theme'),
                trailing: Switch(
                  value: _dynamicTheme,
                  onChanged: (value) {
                    _toggleDynamicTheme();
                  },
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: _dynamicTheme ? null : _openColorPickerDialog,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListTile(
                enabled: !_dynamicTheme,
                leading: const Icon(FluentIcons.color_24_regular),
                title: const Text('Custom Theme Color'),
                trailing: ElevatedButton(
                  onPressed: _dynamicTheme ? null : _openColorPickerDialog,
                  onLongPress: null,
                  child: !_dynamicTheme
                      ? const Text('Pick color')
                      : const Text('Disabled'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _toggleDynamicTheme() {
    setState(() {
      _dynamicTheme = !_dynamicTheme;
    });
    setKeyValue(dynamicTheme, _dynamicTheme);
  }

  void _openColorPickerDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(18.0),
          title: const Text('Color Picker'),
          content: MaterialColorPicker(
            colors: accentColors,
            selectedColor:
                Color(int.parse(getString(themeColor) ?? primaryColor)),
            onColorChange: (color) {
              setKeyValue(
                  themeColor, color.toString().split('(')[1].substring(0, 10));
            },
          ),
          actions: [
            TextButton(
              onPressed: context.pop,
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
