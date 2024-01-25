import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/app/core/widgets/animated_column.dart';
import 'package:vitalize/app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vitalize/app/pages/profile_page/cubit/profile_page_cubit.dart';

List<String> fields = [
  'Student Name',
  'VIT Registration Number',
  'Application Number',
  'Mentor Name',
  'Mentor Cabin',
  'Mentor Email',
  'Mentor intercom',
  'Mentor Mobile Number'
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
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimatedColumn(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 80,
                  backgroundImage: MemoryImage(
                    base64Decode(state.profile['image']!),
                  ),
                ),
                const SizedBox(height: 16),
                for (var field in fields)
                  _buildListItem(
                    field,
                    state.profile[field] ?? '',
                    Theme.of(context).colorScheme.secondary,
                  ),
              ],
            ),
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
          SelectableText(
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
