import 'package:the_moviedb_app/features/main/view/mainView.dart';
import 'package:the_moviedb_app/features/movie_detail/view/movieDetailView.dart';
import 'package:the_moviedb_app/features/splash_screen/view/SplashScreenView.dart';
import 'package:get/get.dart';

routes() => [
  GetPage(name: "/", page: () => SplashScreenView()),
  GetPage(name: "/mainPage", page: () => MainView()),
  GetPage(name: "/movieDetail", page: () => MovieDetailView()),

];