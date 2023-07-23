import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/1_app/core/widgets/circular_progess_indicator.dart';
import 'package:vtop_app/1_app/pages/profile_page/cubit/profile_page_cubit.dart';

List<String> fields = [
  'Application Number',
  'Student Name',
  'Register Number',
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
          return const CircularProgress();
        } else if (state is ProfilePageLoaded) {
          return ListView(
            children: [
              for (var field in fields)
                _buildListItem(field, state.profile[field]!)
            ],
          );
        } else {
          return const Placeholder();
        }
      });

  Widget _buildListItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
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
