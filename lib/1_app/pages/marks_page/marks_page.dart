import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/1_app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vtop_app/1_app/pages/marks_page/cubit/marks_page_cubit.dart';
import 'package:vtop_app/1_app/pages/marks_page/cubit/semester_id_menu_cubit.dart';
import 'package:vtop_app/1_app/pages/marks_page/widgets/marks_card.dart';

class MarksPageProvider extends StatelessWidget {
  const MarksPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SemesterIDsMenuCubit()..getSemIDs(),
      child: BlocProvider(
        create: (context) => MarksPageCubit(),
        child: const MarksPage(),
      ),
    );
  }
}

class MarksPage extends StatelessWidget {
  const MarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<SemesterIDsMenuCubit, SemesterIDsMenuState>(
        builder: (context, state) {
          if (state is SemesterIDsMenuInitial) {
            return const CenteredCircularProgressBar();
          } else if (state is SemesterIDsMenuLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownMenu(
                  onSelected: (value) =>
                      BlocProvider.of<MarksPageCubit>(context).getMarks(value),
                  label: const Text(
                    'Select Semester',
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
                ),
                const SizedBox(height: 8),
                BlocBuilder<MarksPageCubit, MarksPageState>(
                  builder: (context, state) {
                    if (state is MarksPageInitial) {
                      return const SizedBox();
                    } else if (state is MarksPageLoading) {
                      return Expanded(
                        child: SizedBox(
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      );
                    } else if (state is MarksPageLoaded) {
                      if (state.marks.isEmpty) {
                        return const Center(
                          child: Text('No marks available in this semester.'),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.marks.length,
                            itemBuilder: (context, index) => MarksCard(
                              subject: state.marks.values.elementAt(index),
                            ),
                          ),
                        );
                      }
                    } else {
                      return const Placeholder();
                    }
                  },
                ),
              ],
            );
          } else {
            return const Placeholder();
          }
        },
      ),
    );
  }
}
