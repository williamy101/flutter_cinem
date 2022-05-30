import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState()) {
    on<OnSelectedDateEvent>(_onSelectedDate);
    on<OnSelectedTimeEvent>(_onSelectedTime);
    on<OnSelectedSeatsEvent>(_onSelectedSeats);
    on<OnSelectMovieEvent>(_onSelectedMovie);
  }
  List<String> seats = [];

  Future<void> _onSelectedDate(
      OnSelectedDateEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(date: event.date));
  }

  Future<void> _onSelectedTime(
      OnSelectedTimeEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(time: event.time));
  }

  Future<void> _onSelectedSeats(
      OnSelectedSeatsEvent event, Emitter<MovieState> emit) async {
    if (seats.contains(event.selectedSeats)) {
      seats.remove(event.selectedSeats);
      emit(state.copyWith(selectedSeats: seats));
    } else {
      seats.add(event.selectedSeats);
      emit(state.copyWith(selectedSeats: seats));
    }
  }

  Future<void> _onSelectedMovie(
      OnSelectMovieEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(nameMovie: event.name, imageMovie: event.image));
  }
}
