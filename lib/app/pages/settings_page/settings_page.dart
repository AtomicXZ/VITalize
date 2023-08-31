import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:vitalize/app/core/utils/schedule_notifcations.dart';
import 'package:vitalize/app/core/theme/vitalise_theme.dart';
import 'package:vitalize/app/core/utils/hive_user_box_utils.dart';
import 'package:vitalize/app/core/widgets/animated_column.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _dynamicTheme;
  late double _currentNotificationValue;

  @override
  void initState() {
    _dynamicTheme = isTrue(dynamicTheme);
    _currentNotificationValue = double.parse(getString(reminderTime) ?? '0');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: AnimatedColumn(
        children: [
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(FluentIcons.color_24_regular),
                title: const Text('Use dynamic theme'),
                trailing: Switch(
                  value: _dynamicTheme,
                  onChanged: (value) {
                    setState(() {
                      _dynamicTheme = value;
                    });
                    setKeyValue(dynamicTheme, value);
                  },
                ),
              ),
            ),
          ),
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListTile(
                leading: const Icon(FluentIcons.mail_24_regular),
                title: const Text('Schedule notifications for classes'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Slider(
                    value: _currentNotificationValue,
                    max: 30,
                    divisions: 6,
                    label: _currentNotificationValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentNotificationValue = value;
                      });
                    },
                    onChangeEnd: (value) {
                      setKeyValue(reminderTime, value);
                      scheduleClassNotifcations(value.round());
                      if (value == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Class notifications are disabled.'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
