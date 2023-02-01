import 'package:get/get.dart';
import 'package:the_moviedb_app/features/content_movie/model/movieNowPlayingModel.dart';
import 'package:the_moviedb_app/features/content_movie/model/moviePopularModel.dart';
import 'package:the_moviedb_app/features/content_movie/model/movieUpcomingModel.dart';
import 'package:the_moviedb_app/features/reusable_widget/movieTileWidget.dart';
import 'package:the_moviedb_app/routes/router.dart';
import 'package:the_moviedb_app/utilities/apiHandler.dart';
import 'package:the_moviedb_app/utilities/apiRequestStatus.dart';
import 'package:the_moviedb_app/utilities/function.dart';

class ContentMovieController extends GetxController {
  var x = (Get.width - (Get.width * 0.15)).obs;
  var y = (Get.height - (Get.height * 0.20)).obs;
  var indexBottomNavigation = 0.obs;
  var apiRequestStatus = APIRequestStatus.unInitialized.obs;
  var movieNowPlayingData = <MovieTileModel>[].obs;
  var movieUpcomingData = <MovieTileModel>[].obs;
  var moviePopularData = <MovieTileModel>[].obs;

  @override
  void onInit() {
    getDataMovie();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getDataMovie() async {
    setApiRequestStatus(APIRequestStatus.loading);
    try {
      MovieNowPlayingModel movieNowPlayingModel =
          await Get.find<ApiHandler>().getMovieNowPlaying();
      setNowPlaying(movieNowPlayingModel);
      MovieUpcomingModel movieUpcomingModel =
          await Get.find<ApiHandler>().getMovieUpcoming();
      setUpcoming(movieUpcomingModel);
      MoviePopularModel moviePopularModel =
          await Get.find<ApiHandler>().getMoviePopular();
      setPopular(moviePopularModel);
      setApiRequestStatus(APIRequestStatus.loaded);
    } catch (e) {
      checkError(e);
    }
  }

  void checkError(e) {
    if (Functions.checkConnectionError(e)) {
      setApiRequestStatus(APIRequestStatus.connectionError);
    } else {
      setApiRequestStatus(APIRequestStatus.error);
    }
  }

  void setApiRequestStatus(APIRequestStatus value) {
    apiRequestStatus.value = value;
  }

  void setNowPlaying(MovieNowPlayingModel data) {
    List<MovieTileModel> viewModels = data.results.map((movie) {
      return MovieTileModel(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath ?? "",
        overview: movie.overview,
      );
    }).toList();
    movieNowPlayingData.value = viewModels;
  }

  void setUpcoming(MovieUpcomingModel data) {
    List<MovieTileModel> viewModels = data.results.map((movie) {
      return MovieTileModel(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath ?? "",
        overview: movie.overview,
      );
    }).toList();
    movieUpcomingData.value = viewModels;
  }

  void setPopular(MoviePopularModel data) {
    List<MovieTileModel> viewModels = data.results.map((movie) {
      return MovieTileModel(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath ?? "",
        overview: movie.overview,
      );
    }).toList();
    moviePopularData.value = viewModels;
  }

  gotoDetailMovie(String id) {
    MyRouter.pushPageArguments("detailMovie", MovieDetailArguments(id));
  }
}

class MovieDetailArguments {
  final String movieId;

  MovieDetailArguments(this.movieId);
}
