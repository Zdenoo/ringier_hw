import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ringier_flutter_hw/pages/main_page.dart';
import 'package:ringier_flutter_hw/pages/results_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocBuilder<NavigationBloc, NavigationState>(builder: (_, state) {
      if (state is SearchPageState) {
        return const HomePage();
      }
      if (state is ResultsPageState) {
        return const BooksResultPage();
      }
      return Scaffold(
          body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: const Text("Not Found"),
      ));
    }));
  }
}
