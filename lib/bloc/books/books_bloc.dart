import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ringier_flutter_hw/repository/books_repository.dart';

import '../../models/books.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required this.searchRepository}) : super(BooksLoading()) {
    on<SearchBooks>(_onStarted);
  }

  final BooksRepository searchRepository;

  Future<void> _onStarted(
    SearchBooks event,
    Emitter<BooksState> emit,
  ) async {
    emit(BooksLoading());
    try {
      final booksSearched =
          await searchRepository.searchBooks(event.searchTerm);
      emit(BooksLoaded(booksSearched));
    } catch (_) {
      emit(BooksError());
    }
  }
}

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(SearchPageState()) {
    on<SearchPage>((event, emit) => emit(SearchPageState()));
    on<ResultsPage>((event, emit) => emit(ResultsPageState()));
  }
}
