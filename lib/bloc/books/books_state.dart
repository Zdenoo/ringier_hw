part of 'books_bloc.dart';

abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  const BooksLoaded(this.books);

  final List<Book> books;

  @override
  List<Object> get props => [books];
}

class BooksError extends BooksState {}

@immutable
abstract class NavigationState {}

class SearchPageState extends NavigationState {}

class ResultsPageState extends NavigationState {}
