part of 'movie_bloc.dart';

@immutable
class MovieState {
  final String nameMovie;
  final String imageMovie;
  final String date;
  final String time;
  final List<String> selectedSeats;

  MovieState(
      {this.nameMovie = '',
      this.imageMovie = '',
      this.date = '0',
      this.time = '00',
      List<String>? selectedSeats})
      : selectedSeats = selectedSeats ?? [];

  MovieState copyWith(
          {String? date,
          String? time,
          List<String>? selectedSeats,
          String? nameMovie,
          String? imageMovie}) =>
      MovieState(
          nameMovie: nameMovie ?? this.nameMovie,
          imageMovie: imageMovie ?? this.imageMovie,
          date: date ?? this.date,
          time: time ?? this.time,
          selectedSeats: selectedSeats ?? this.selectedSeats);
}
