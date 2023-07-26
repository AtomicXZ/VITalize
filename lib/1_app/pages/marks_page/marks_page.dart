import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/1_app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vtop_app/1_app/pages/marks_page/cubit/marks_page_cubit.dart';

class MarksPageProvider extends StatelessWidget {
  const MarksPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SemesterIDsMenuCubit()..getSemIDs(),
      child: const MarksPage(),
    );
  }
}

class MarksPage extends StatelessWidget {
  const MarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<SemesterIDsMenuCubit, SemesterIDsMenuState>(
            builder: (context, state) {
              if (state is SemesterIDsMenuInitial) {
                return const Expanded(child: CenteredCircularProgressBar());
              } else if (state is SemesterIDsMenuLoaded) {
                return DropdownMenu(
                  label: const Text(
                    'Select Semester ID',
                    style: TextStyle(fontSize: 16),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  dropdownMenuEntries: state.semIDs.entries
                      .map((e) =>
                          DropdownMenuEntry(value: e.key, label: e.value))
                      .toList(),
                );
              } else {
                return const Placeholder();
              }
            },
          ),
        ],
      ),
    );
  }
}
