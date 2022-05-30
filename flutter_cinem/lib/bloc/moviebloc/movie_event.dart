part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class OnSelectMovieEvent extends MovieEvent {
  final String name;
  final String image;

  OnSelectMovieEvent(this.name, this.image);
}

class OnSelectedDateEvent extends MovieEvent {
  final String date;

  OnSelectedDateEvent(this.date);
}

class OnSelectedTimeEvent extends MovieEvent {
  final String time;

  OnSelectedTimeEvent(this.time);
}

class OnSelectedSeatsEvent extends MovieEvent {
  final String selectedSeats;

  OnSelectedSeatsEvent(this.selectedSeats);
}
