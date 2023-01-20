
import 'package:get/get.dart';
import 'package:the_moviedb_app/features/content_movie/model/movieNowPlayingModel.dart';
import 'package:the_moviedb_app/features/content_movie/model/moviePopularModel.dart';
import 'package:the_moviedb_app/features/content_movie/model/movieUpcomingModel.dart';
import 'package:the_moviedb_app/routes/router.dart';
import 'package:the_moviedb_app/utilities/apiHandler.dart';
import 'package:the_moviedb_app/utilities/apiRequestStatus.dart';
import 'package:the_moviedb_app/utilities/function.dart';

class ContentMovieController extends GetxController {
  var x = (Get.width - (Get.width * 0.15)).obs;
  var y = (Get.height - (Get.height * 0.20)).obs;
  var indexBottomNavigation = 0.obs;
  var apiRequestStatus = APIRequestStatus.unInitialized.obs;
  var movieNowPlayingData = MovieNowPlayingModel(
      page: 0,
      results: [],
      totalPages: 0,
      totalResults: 0).obs;
  var movieUpcomingData = MovieUpcomingModel(
      page: 0,
      results: [],
      totalPages: 0).obs;
  var moviePopularData = MoviePopularModel(
      page: 0,
      results: [],
      totalPages: 0,
      totalResults: 0).obs;

  @override
  void onInit() {
    getDataMovie();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getDataMovie() async{
    setApiRequestStatus(APIRequestStatus.loading);
    try {
      MovieNowPlayingModel movieNowPlayingModel = await ApiHandler.getMovieNowPlaying();
      setNowPlaying(movieNowPlayingModel);
      MovieUpcomingModel movieUpcomingModel = await ApiHandler.getMovieUpcoming();
      setUpcoming(movieUpcomingModel);
      MoviePopularModel moviePopularModel = await ApiHandler.getMoviePopular();
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

  void setNowPlaying(data) {
    movieNowPlayingData.value = data;
  }

  void setUpcoming(data) {
    movieUpcomingData.value = data;
  }

  void setPopular(data) {
    moviePopularData.value = data;
  }

  gotoDetailMovie(String id){
    MyRouter.pushPageArguments("detailMovie", MovieDetailArguments(id));
  }
}

class MovieDetailArguments {
  final String movieId;

  MovieDetailArguments(this.movieId);
}