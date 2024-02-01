import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:vitalize/app/pages/attendance_page/widgets/attendance_detail_card.dart';
import 'package:vitalize/app/pages/attendance_page/widgets/attendance_detail_summary_card.dart';
import 'package:vitalize/data/models/attendance.dart';

class AttendanceDetailPage extends StatelessWidget {
  final Attendance attendance;

  const AttendanceDetailPage({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: attendance.attendanceDetail.length + 1,
      itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 100),
        child: SlideAnimation(
          verticalOffset: 44,
          child: FadeInAnimation(
            child: _getChildForList(index - 1),
          ),
        ),
      ),
    );
  }

  Widget _getChildForList(int index) {
    if (index == -1) return AttendanceDetailSummaryCard(attendance: attendance);
    return AttendanceDetailCard(
      attendanceDetail: attendance.attendanceDetail.entries.elementAt(index),
    );
  }
}
