class MovieModel {
  final String id;
  final String name;
  final String image;
  final String category;
  final String rating;
  final String duration;
  final String description;

  const MovieModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.category,
      required this.rating,
      required this.duration,
      required this.description});

  static List<MovieModel> listMovie = [
    const MovieModel(
        id: '3',
        name: 'No Time to Die',
        image: 'assets/images/movies/movie1.jpg',
        category: '+18',
        rating: '8/10',
        duration: '2h 43m',
        description:
            'In "No Time to Die", James Bond (Daniel Craig) finds himself enjoying a well-deserved vacation in Jamaica. However, his peace ends when his CIA friend, Felix Leiter (Jeffrey Wright), seeks him out for a new mission that involves rescuing an important scientist who has been kidnapped.'),
    const MovieModel(
        id: '4',
        name: 'Free Guy',
        image: 'assets/images/movies/movie2.jpg',
        category: '+18',
        rating: '8.5/10',
        duration: '1h 55m',
        description:
            'A bank worker discovers that he is actually a player in a video game.'),
    const MovieModel(
        id: '6',
        name: 'Shang-Chi',
        image: 'assets/images/movies/movie3.jpg',
        category: '+13',
        rating: '9/10',
        duration: '2h 12m',
        description:
            'Shang-Chi must face the past that he thought he had left behind when he is drawn into the web of the mysterious Ten Rings organization.'),
  ];
}
