import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'nav_event.dart';
part 'nav_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(SearchPageState()) {
    on<SearchPage>((event, emit) => emit(SearchPageState()));
    on<ResultsPage>((event, emit) => emit(ResultsPageState()));
  }
}
