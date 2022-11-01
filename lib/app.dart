import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ringier_flutter_hw/repository/books_repository.dart';
import 'package:ringier_flutter_hw/pages/init_page.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.booksRepository,
  });

  final BooksRepository booksRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: booksRepository,
      child: BlocProvider(
        create: (_) => BooksBloc(searchRepository: booksRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<NavigationBloc>(
                create: ((context) => NavigationBloc())),
            BlocProvider<BooksBloc>(
                create: ((context) => BooksBloc(
                    searchRepository: context.read<BooksRepository>())))
          ],
          child: const InitPage(),
        );
      },
    );
  }
}
