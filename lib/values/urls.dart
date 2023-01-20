class Url {
  /// Base URL
  static String server = "https://api.themoviedb.org/3";
  static String baseImage = "https://image.tmdb.org/t/p/w92";

  /// Function URL
  static String urlGetMovieNowPlaying = "$server/movie/now_playing";
  static String urlGetMovieUpcoming = "$server/movie/upcoming";
  static String urlGetMoviePopular = "$server/movie/popular";
  static String urlGetMovieDetail = "$server/movie";

  static String urlGetTVOnTheAir = "$server/tv/on_the_air";
  static String urlGetTVPopular = "$server/tv/popular";

}
