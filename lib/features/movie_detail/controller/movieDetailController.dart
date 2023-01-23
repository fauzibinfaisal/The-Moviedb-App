import 'package:get/get.dart';
import 'package:the_moviedb_app/features/movie_detail/model/movieDetailModel.dart';
import 'package:the_moviedb_app/features/movie_detail/model/movieReviewModel.dart';
import 'package:the_moviedb_app/utilities/apiHandler.dart';
import 'package:the_moviedb_app/utilities/apiRequestStatus.dart';
import 'package:the_moviedb_app/utilities/function.dart';

class MovieDetailController extends GetxController{
  var apiRequestStatus = APIRequestStatus.unInitialized.obs;
  var movieDetailModel = MovieDetailModel().obs;
  var movieReviewModel = MovieReviewModel(
      page: 0,
      results: [],
      totalPages: 0,
      totalResults: 0).obs;
  late String id;


  @override
  void onInit() {
    // TODO: implement onInit
    id = Get.arguments.movieId.toString();
    getData();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void getData() async{
    setApiRequestStatus(APIRequestStatus.loading);
    try {
      MovieDetailModel movieDetailModel = await Get.find<ApiHandler>().getMovieDetail(id);
      setMovieData(movieDetailModel);
      MovieReviewModel movieReviewModel = await Get.find<ApiHandler>().getMovieReview(id);
      setRatingData(movieReviewModel);
      print("movieReviewModel.length ${movieReviewModel.results.length}");
      setApiRequestStatus(APIRequestStatus.loaded);
    } catch (e) {
      checkError(e);
    }
  }

  setMovieData(data){
    movieDetailModel.value = data;
  }

  setRatingData(data){
    movieReviewModel.value = data;
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

}