import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_moviedb_app/features/content_movie/model/movieNowPlayingModel.dart';
import 'package:the_moviedb_app/features/content_movie/model/moviePopularModel.dart';
import 'package:the_moviedb_app/features/content_movie/model/movieUpcomingModel.dart';
import 'package:the_moviedb_app/features/movie_detail/model/movieDetailModel.dart';
import 'package:the_moviedb_app/features/movie_detail/model/movieReviewModel.dart';
import 'package:the_moviedb_app/features/television/model/tvOnAirModel.dart';
import 'package:the_moviedb_app/features/television/model/tvPopularModel.dart';
import 'package:the_moviedb_app/values/secret.dart';
import 'package:the_moviedb_app/values/urls.dart';

class ApiHandler {
  final http.Client _http;

  ApiHandler(this._http);

  //MOVIE NOW PLAYING LIST
  Future<MovieNowPlayingModel> getMovieNowPlaying() async {
    var urlString = "${Url.urlGetMovieNowPlaying}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await _http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    MovieNowPlayingModel dataJson;
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body);
      dataJson = MovieNowPlayingModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }

  //MOVIE UPCOMING LIST
  Future<MovieUpcomingModel> getMovieUpcoming() async {
    var urlString = "${Url.urlGetMovieUpcoming}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await _http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    MovieUpcomingModel dataJson;
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body);
      dataJson = MovieUpcomingModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }

  //MOVIE POPULAR LIST
  Future<MoviePopularModel> getMoviePopular() async {
    var urlString = "${Url.urlGetMoviePopular}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await _http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    MoviePopularModel dataJson;
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body);
      dataJson = MoviePopularModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }

  //TV ON THE AIR LIST
  Future<TvOnAirModel> getTvOnAir() async {
    var urlString = "${Url.urlGetTVOnTheAir}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await _http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    TvOnAirModel dataJson;
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body);
      dataJson = TvOnAirModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }

  //TV POPULAR LIST
  Future<TvPopularModel> getTvPopular() async {
    var urlString = "${Url.urlGetTVPopular}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await _http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    TvPopularModel dataJson;
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body);
      dataJson = TvPopularModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }

  //MOVIE DETAIL
  Future<MovieDetailModel> getMovieDetail(String id) async {
    var urlString = "${Url.urlGetMovieDetail}/$id?api_key=$API_KEY";
    print(urlString);
    var url = Uri.parse(urlString);
    final response = await _http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    MovieDetailModel dataJson;
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body);
      dataJson = MovieDetailModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }

  //MOVIE REVIEW LIST
  Future<MovieReviewModel> getMovieReview(String id) async {
    var urlString = "${Url.urlGetMovieDetail}/$id/reviews?api_key=$API_KEY";
    print(urlString);
    var url = Uri.parse(urlString);
    final response = await _http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    MovieReviewModel dataJson;
    if (response.statusCode == 200) {
      final dataResponse = jsonDecode(response.body);
      dataJson = MovieReviewModel.fromJson(dataResponse);
    } else {
      dataJson = MovieReviewModel(
          page: 0, results: [], totalPages: 0, totalResults: 0);
    }
    return dataJson;
  }
}
