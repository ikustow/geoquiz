import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/models/progress_value_details.dart';
import 'package:geoquiz/progress/bloc/progress_bloc.dart';
import 'package:geoquiz/progress/widgets/progress_list_widget.dart';

import '../generated/l10n.dart';
import '../home/widgets/bottom_navigation_bar.dart';
import '../services/airtable_service.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProgressBloc(
        RepositoryProvider.of<AirtableService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).progress_appbar_title,
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(index: 1),
        body: BlocBuilder<ProgressBloc, ProgressState>(
            builder: (BuildContext context, state) {
          if (state is ProgressLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProgressLoadedState) {
            return ProgressList(
              progressValues: state.progress,
            );
          }
          return Text('TE');
        }),
      ),
    );
  }
}





