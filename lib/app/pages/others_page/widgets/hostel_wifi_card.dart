import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitalize/data/utils/wifi_creds_utils.dart';

class HostelWifiCard extends StatefulWidget {
  const HostelWifiCard({super.key});

  @override
  State<HostelWifiCard> createState() => _HostelWifiCardState();
}

class _HostelWifiCardState extends State<HostelWifiCard> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(FluentIcons.wifi_1_20_filled),
            title: Text('Login to Hostel WiFi'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    int code = await loginSophosClient();
                    if (code == -1) {
                      _showPasswordDialog(context);
                    } else if (code == 0) {
                      _showSnackbar(context, 'Logged in to Hostel WiFi.');
                    } else if (code == 1) {
                      _showSnackbar(context, 'Maximum login limit reached');
                    } else {
                      _showSnackbar(
                          context, 'Password incorrect. Edit the password.');
                    }
                  },
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showSnackbar(context, 'Logged out of Hostel WiFi');
                    logoutSophosClient();
                  },
                  child: const Text('Logout'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showPasswordDialog(context);
                  },
                  child: const Text('Edit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> _showPasswordDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Enter your password'),
        content: TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            prefixIcon: const Icon(FluentIcons.password_16_filled),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Enter'),
            onPressed: () {
              saveWifiPassword(_passwordController.text);
              _showSnackbar(context, 'Password Saved. Try logging in again.');
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
