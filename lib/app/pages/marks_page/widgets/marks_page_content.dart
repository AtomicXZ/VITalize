import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/app/core/widgets/animated_column.dart';
import 'package:vitalize/app/core/widgets/center_widget_in_column.dart';
import 'package:vitalize/app/pages/marks_page/cubit/marks_page_cubit.dart';
import 'package:vitalize/app/pages/marks_page/cubit/semester_id_menu_cubit.dart';
import 'package:vitalize/app/pages/marks_page/widgets/marks_card.dart';

class MarksPageContent extends StatelessWidget {
  final SemesterIDsMenuLoaded semIDstate;

  const MarksPageContent(this.semIDstate, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        BlocBuilder<MarksPageCubit, MarksPageState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 4),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  value: BlocProvider.of<MarksPageCubit>(context).semID == ''
                      ? null
                      : BlocProvider.of<MarksPageCubit>(context).semID,
                  hint: const Text('Select Semester'),
                  buttonStyleData: ButtonStyleData(
                    height: 75,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: colorScheme.secondary,
                      ),
                      color: colorScheme.surface,
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: IconStyleData(
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: colorScheme.primary,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: colorScheme.secondaryContainer,
                    ),
                    offset: const Offset(0, -10),
                  ),
                  onChanged: (value) => BlocProvider.of<MarksPageCubit>(context)
                      .getMarks(value.toString()),
                  items: semIDstate.semIDs.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.key, child: Text(e.value)))
                      .toList(),
                ),
              ),
            );
          },
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
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: AnimatedColumn(
          children: [
            for (var subject in state.marks.values)
              MarksCard(
                subject: subject,
              ),
          ],
        ),
      ),
    );
  }
}
