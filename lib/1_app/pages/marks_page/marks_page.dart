import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/1_app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vtop_app/1_app/pages/marks_page/cubit/grades_page_cubit.dart';
import 'package:vtop_app/1_app/pages/marks_page/cubit/marks_page_cubit.dart';
import 'package:vtop_app/1_app/pages/marks_page/cubit/semester_id_menu_cubit.dart';
import 'package:vtop_app/1_app/pages/marks_page/widgets/grades_page_content.dart';
import 'package:vtop_app/1_app/pages/marks_page/widgets/marks_page_content.dart';

class MarksPageProvider extends StatelessWidget {
  const MarksPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SemesterIDsMenuCubit>(
          create: (context) => SemesterIDsMenuCubit()..getSemIDs(),
        ),
        BlocProvider<MarksPageCubit>(
          create: (context) => MarksPageCubit(),
        ),
        BlocProvider<GradesPageCubit>(
          create: (context) => GradesPageCubit()..getGrades(),
        )
      ],
      child: const MarksPage(),
    );
  }
}

class MarksPage extends StatelessWidget {
  const MarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
            unselectedLabelColor: Theme.of(context).colorScheme.secondary,
            splashBorderRadius: BorderRadius.circular(80),
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              color:
                  Theme.of(context).colorScheme.inversePrimary.withOpacity(0.4),
            ),
            tabs: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Marks'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Grades'),
              )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              children: [
                BlocBuilder<SemesterIDsMenuCubit, SemesterIDsMenuState>(
                  builder: (context, state) {
                    if (state is SemesterIDsMenuInitial) {
                      return const CenteredCircularProgressBar();
                    } else if (state is SemesterIDsMenuLoaded) {
                      return MarksPageContent(state);
                    } else {
                      return const Placeholder();
                    }
                  },
                ),
                BlocBuilder<GradesPageCubit, GradesPageState>(
                    builder: (context, state) {
                  if (state is GradesPageInitial) {
                    return const CenteredCircularProgressBar();
                  } else if (state is GradesPageLoaded) {
                    return GradesPageContent(state.grades);
                  } else {
                    return const Placeholder();
                  }
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
