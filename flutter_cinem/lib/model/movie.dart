class MovieModel {
  final String id;
  final String name;
  final String image;
  final double qualification;
  final int year;
  final String duration;
  final String genre;
  final String description;

  const MovieModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.qualification,
      required this.year,
      required this.duration,
      required this.genre,
      required this.description});

  static List<MovieModel> listMovie = [
    MovieModel(
        id: '3',
        name: 'No Time to Die',
        image: 'assets/images/movies/movie1.jpg',
        qualification: 4,
        year: 2021,
        duration: '2h 43m',
        genre: 'Action',
        description:
            'In "No Time to Die", James Bond (Daniel Craig) finds himself enjoying a well-deserved vacation in Jamaica. However, his peace ends when his CIA friend, Felix Leiter (Jeffrey Wright), seeks him out for a new mission that involves rescuing an important scientist who has been kidnapped.'),
    MovieModel(
        id: '4',
        name: 'Free Guy',
        image: 'assets/images/movies/movie2.jpg',
        qualification: 4.8,
        year: 2021,
        duration: '1h 55m',
        genre: 'Science fiction',
        description:
            'A bank worker discovers that he is actually a player in a video game.'),
    MovieModel(
        id: '6',
        name: 'Shang-Chi',
        image: 'assets/images/movies/movie3.jpg',
        qualification: 4.2,
        year: 2021,
        duration: '2h 12m',
        genre: 'Science fiction',
        description:
            'Shang-Chi must face the past that he thought he had left behind when he is drawn into the web of the mysterious Ten Rings organization.'),
  ];
}