
import 'package:get/get.dart';
import 'package:the_moviedb_app/features/reusable_widget/movieTileWidget.dart';
import 'package:the_moviedb_app/features/television/model/tvOnAirModel.dart';
import 'package:the_moviedb_app/features/television/model/tvPopularModel.dart';
import 'package:the_moviedb_app/utilities/apiHandler.dart';
import 'package:the_moviedb_app/utilities/apiRequestStatus.dart';
import 'package:the_moviedb_app/utilities/function.dart';

class TvController extends GetxController {
  var x = (Get.width - (Get.width * 0.15)).obs;
  var y = (Get.height - (Get.height * 0.20)).obs;
  var indexBottomNavigation = 0.obs;
  var apiRequestStatus = APIRequestStatus.unInitialized.obs;
  var tvOnAirModel = <MovieTileModel>[].obs;
  var tvPopularModel = <MovieTileModel>[].obs;

  @override
  void onInit() {
    getDataTV();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getDataTV() async{
    setApiRequestStatus(APIRequestStatus.loading);
    try {
      TvOnAirModel tvOnAirModel = await Get.find<ApiHandler>().getTvOnAir();
      setOnAir(tvOnAirModel);
      TvPopularModel tvPopularModel = await Get.find<ApiHandler>().getTvPopular();
      setPopular(tvPopularModel);
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

  void setOnAir(TvOnAirModel data) {
    List<MovieTileModel> viewModels = data.results.map((tv) {
      return MovieTileModel(
        id: tv.id,
        title: tv.name,
        posterPath: tv.posterPath ?? "",
        overview: tv.overview,
      );
    }).toList();
    tvOnAirModel.value = viewModels;
  }

  void setPopular(TvPopularModel data) {
    List<MovieTileModel> viewModels = data.results.map((tv) {
      return MovieTileModel(
        id: tv.id,
        title: tv.name,
        posterPath: tv.posterPath ?? "",
        overview: tv.overview,
      );
    }).toList();
    tvPopularModel.value = viewModels;
  }
}

class MovieDetailArguments {
  final String movieId;

  MovieDetailArguments(this.movieId);
}