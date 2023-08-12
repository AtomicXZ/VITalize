import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/app/core/widgets/center_widget_in_column.dart';
import 'package:vitalize/app/pages/marks_page/cubit/marks_page_cubit.dart';
import 'package:vitalize/app/pages/marks_page/cubit/semester_id_menu_cubit.dart';
import 'package:vitalize/app/pages/marks_page/widgets/marks_card.dart';

class MarksPageContent extends StatelessWidget {
  final SemesterIDsMenuLoaded state;

  const MarksPageContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: DropdownMenu(
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
                .map((e) => DropdownMenuEntry(value: e.key, label: e.value))
                .toList(),
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<MarksPageCubit, MarksPageState>(
          builder: (context, state) {
            if (state is MarksPageInitial) {
              return const SizedBox();
            } else if (state is MarksPageLoading) {
              return const CenterWidgetInColumn(
                  child: CircularProgressIndicator());
            } else if (state is MarksPageError) {
              return _buildErrorWidget(context);
            } else if (state is MarksPageNoData) {
              return CenterWidgetInColumn(
                child: Text(
                  'No marks available for this semester.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18),
                ),
              );
            } else if (state is MarksPageLoaded) {
              return _buildMarksList(state);
            } else {
              return const Placeholder();
            }
          },
        ),
      ],
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FluentIcons.error_circle_24_filled,
              color: Colors.redAccent,
              size: 60,
            ),
            const SizedBox(height: 8),
            Text(
              'Something went wrong.',
              style: const TextStyle().copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<MarksPageCubit>(context).getMarksFromVar(),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarksList(MarksPageLoaded state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.marks.length,
        itemBuilder: (context, index) => MarksCard(
          subject: state.marks.values.elementAt(index),
        ),
      ),
    );
  }
}
