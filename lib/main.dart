import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringier_flutter_hw/app.dart';
import 'package:ringier_flutter_hw/repository/books_repository.dart';

import 'bloc/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    App(
      booksRepository: BooksRepository(),
    ),
  );
}
