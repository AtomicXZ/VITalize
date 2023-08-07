import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vtop_app/1_app/core/widgets/centered_circular_progress_bar.dart';
import 'package:vtop_app/1_app/pages/attendance_page/cubit/attendance_page_cubit.dart';
import 'package:vtop_app/1_app/pages/attendance_page/widgets/attendance_card.dart';

class AttendancePageProvider extends StatelessWidget {
  const AttendancePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendancePageCubit()..loadAttendance(),
      child: const AttendancePage(),
    );
  }
}

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendancePageCubit, AttendancePageState>(
      builder: (context, state) {
        if (state is AttendancePageInitial) {
          return const CenteredCircularProgressBar();
        } else if (state is AttendancePageLoaded) {
          return ListView.builder(
            itemCount: state.attendance.length,
            itemBuilder: (context, index) => AttendanceCard(
                attendance: state.attendance.values.elementAt(index)),
          );
        } else if (state is AttendancePageNoAttendanceInThisSem) {
          return Center(
              child: Text(
            'No Attendance in current semester yet.',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
          ));
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
