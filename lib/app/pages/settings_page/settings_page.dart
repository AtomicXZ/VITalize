import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
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

  @override
  void initState() {
    _dynamicTheme = isTrue(dynamicTheme);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedColumn(children: [
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
              subtitle: _dynamicTheme
                  ? const Text('Disabled')
                  : Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: MaterialColorPicker(
                        shrinkWrap: true,
                        selectedColor: Color(
                            int.parse(getString(themeColor) ?? primaryColor)),
                        onColorChange: (color) {
                          setKeyValue(themeColor,
                              color.toString().split('(')[1].substring(0, 10));
                        },
                      ),
                    )),
        ),
      ),
    ]);
  }
}
