import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalize/app/pages/settings_page/widgets/cubit/rebuild_boxes_cubit.dart';

class RebuildBoxesCardProvider extends StatelessWidget {
  const RebuildBoxesCardProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RebuildBoxesCubit(),
      child: const RebuildBoxesCard(),
    );
  }
}

class RebuildBoxesCard extends StatelessWidget {
  const RebuildBoxesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<RebuildBoxesCubit, RebuildBoxesState>(
      listener: (context, state) {
        if (state is RebuildBoxesLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                content: const SizedBox(
                  width: 56.0,
                  height: 56.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          );
        } else if (state is RebuildBoxesSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Boxes rebuilt successfully.',
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: InkWell(
          onTap: BlocProvider.of<RebuildBoxesCubit>(context).rebuildBoxes,
          borderRadius: BorderRadius.circular(12),
          child: const ListTile(
            leading: Icon(FluentIcons.arrow_clockwise_16_filled),
            title: Text('Reset all boxes and fetch data'),
            subtitle: Text('Use if facing issues.'),
          ),
        ),
      ),
    );
  }
}
