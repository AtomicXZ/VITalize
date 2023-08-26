import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vitalize/app/core/routes/go_route_config.dart';
import 'package:vitalize/app/pages/login_page/cubit/login_page_cubit.dart';
import 'package:vitalize/app/pages/login_page/login_page_view_states.dart';

class LoginPageProvider extends StatelessWidget {
  const LoginPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(32.0),
              constraints: const BoxConstraints(maxWidth: 350),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Welcome to VITalize',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  BlocListener<LoginPageCubit, LoginPageState>(
                    listener: (context, state) {
                      if (state.status == LoginStatus.success) {
                        context.goNamed(homePageConfig.name);
                      } else if (state.status == LoginStatus.serverOffline) {
                        _showPopup(context, 'Server is offline',
                            'Try again later or try contacting the developer.');
                      } else if (state.status == LoginStatus.failure) {
                        _showPopup(context, state.message, state.subtitle);
                      }
                    },
                    child: BlocBuilder<LoginPageCubit, LoginPageState>(
                      builder: (context, state) {
                        if (state.status == LoginStatus.loading) {
                          return const CircularProgressIndicator();
                        } else {
                          return const LoginForm();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPopup(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        content: Text(content),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
