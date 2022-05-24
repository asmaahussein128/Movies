class Movie {
  int id;
  String title;
  String original_title;
  num vote_average;
  String poster_path;
  String backdrop_path;
  String release_date;
  String overview;
  Movie(
      {required this.overview,required this.title,
      required this.original_title,
      required this.vote_average,
      required this.id,
      required this.backdrop_path,
      required this.poster_path,
      required this.release_date});



}
