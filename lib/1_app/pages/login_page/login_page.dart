import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../0_data/utils/verify_creds.dart';
import '../../core/routes/go_route_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late String _username;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Center(
          child: Card(
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.all(32.0),
          constraints: const BoxConstraints(maxWidth: 350),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.school,
                  size: 100,
                ),
                _gap(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Welcome to VTOP-AP',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Enter your Reg. ID and password to continue.",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                _gap(),
                TextFormField(
                  onSaved: (newValue) => _username = newValue ?? '',
                  decoration: InputDecoration(
                    labelText: 'Reg. ID',
                    hintText: 'Enter your Reg. ID',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                _gap(),
                TextFormField(
                  onSaved: (newValue) => _password = newValue ?? '',
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                _gap(),
                SizedBox(
                  width: 125,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () async {
                      _formKey.currentState!.save();
                      if (await isValid(_username, _password)) {
                        Box<String> userBox = Hive.box('userBox');
                        userBox.putAll({
                          'username': _username,
                          'password': _password,
                          'isFirstLaunch': 'false',
                        });
                        context.goNamed(homePageConfig.name);
                      } else {
                        _showInvalidCredentialsPopup(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    ));
  }

  Widget _gap() => const SizedBox(height: 16);

  void _showInvalidCredentialsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invalid Credentials'),
        content: const Text('The username or password is incorrect.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
