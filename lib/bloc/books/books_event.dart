part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();
}

class SearchBooks extends BooksEvent {
  final String searchTerm;
  @override
  List<Object> get props => [searchTerm];

  const SearchBooks({required this.searchTerm});
}

@immutable
abstract class NavigationEvent {}

class SearchPage extends NavigationEvent {}

class ResultsPage extends NavigationEvent {}
