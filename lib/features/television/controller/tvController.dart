
import 'package:get/get.dart';
import 'package:the_moviedb_app/features/television/model/tvOnAirModel.dart';
import 'package:the_moviedb_app/features/television/model/tvPopularModel.dart';
import 'package:the_moviedb_app/routes/router.dart';
import 'package:the_moviedb_app/utilities/apiHandler.dart';
import 'package:the_moviedb_app/utilities/apiRequestStatus.dart';
import 'package:the_moviedb_app/utilities/function.dart';

class TvController extends GetxController {
  var x = (Get.width - (Get.width * 0.15)).obs;
  var y = (Get.height - (Get.height * 0.20)).obs;
  var indexBottomNavigation = 0.obs;
  var apiRequestStatus = APIRequestStatus.unInitialized.obs;
  var tvOnAirModel = TvOnAirModel(
      page: 0,
      results: [],
      totalPages: 0,
      totalResults: 0).obs;
  var tvPopularModel = TvPopularModel(
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
      TvOnAirModel tvOnAirModel = await ApiHandler.getTvOnAir();
      setOnAir(tvOnAirModel);
      TvPopularModel tvPopularModel = await ApiHandler.getTvPopular();
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

  void setOnAir(data) {
    tvOnAirModel.value = data;
  }

  void setPopular(data) {
    tvPopularModel.value = data;
  }

  gotoDetailMovie(String id){
    MyRouter.pushPageArguments("detailMovie", MovieDetailArguments(id));
  }
}

class MovieDetailArguments {
  final String movieId;

  MovieDetailArguments(this.movieId);
}