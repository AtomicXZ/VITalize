import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vtop_app/0_data/utils/hive_box_utils.dart';
import 'package:vtop_app/1_app/core/routes/go_route_config.dart';
import 'package:vtop_app/1_app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vtop_app/1_app/pages/profile_page/cubit/profile_page_cubit.dart';

List<String> fields = [
  'Student Name',
  'VIT Registration Number',
  'Application Number',
  'Program',
  'Branch',
  'School'
];

class ProfilePageProvider extends StatelessWidget {
  const ProfilePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePageCubit()..loadProfile(),
      child: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProfilePageCubit, ProfilePageState>(
          builder: (context, state) {
        if (state is ProfilePageInitial) {
          return const CenteredCircularProgressBar();
        } else if (state is ProfilePageLoaded) {
          return ListView(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Image.memory(
                    base64.decode(state.profile['image']!),
                    fit: BoxFit.fill,
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              for (var field in fields)
                _buildListItem(
                  field,
                  state.profile[field]!,
                  Theme.of(context).colorScheme.secondary,
                ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  emptyAllBoxes();
                  context.goNamed(loginPageConfig.name);
                },
                child: const Text('Logout'),
              ),
            ],
          );
        } else {
          return const Placeholder();
        }
      });

  Widget _buildListItem(String label, String value, Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Divider(height: 20, thickness: 1),
        ],
      ),
    );
  }
}
