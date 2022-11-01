part of 'nav_bloc.dart';

@immutable
abstract class NavigationEvent {}

class SearchPage extends NavigationEvent {}

class ResultsPage extends NavigationEvent {}
