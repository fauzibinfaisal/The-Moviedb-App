import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_moviedb_app/features/content_movie/model/movieNowPlayingModel.dart';
import 'package:the_moviedb_app/features/content_movie/model/moviePopularModel.dart';
import 'package:the_moviedb_app/features/content_movie/model/movieUpcomingModel.dart';
import 'package:the_moviedb_app/features/television/model/tvOnAirModel.dart';
import 'package:the_moviedb_app/features/television/model/tvPopularModel.dart';
import 'package:the_moviedb_app/values/secret.dart';
import 'package:the_moviedb_app/values/urls.dart';

class ApiHandler {

  static Future<MovieNowPlayingModel> getMovieNowPlaying() async {
    var urlString = "${Url.urlGetMovieNowPlaying}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    MovieNowPlayingModel dataJson;
    if (response.statusCode == 200){
      final dataResponse = jsonDecode(response.body);
      dataJson = MovieNowPlayingModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }

  static Future<MovieUpcomingModel> getMovieUpcoming() async {
    var urlString = "${Url.urlGetMovieUpcoming}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    MovieUpcomingModel dataJson;
    if (response.statusCode == 200){
      final dataResponse = jsonDecode(response.body);
      dataJson = MovieUpcomingModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }

  static Future<MoviePopularModel> getMoviePopular() async {
    var urlString = "${Url.urlGetMoviePopular}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    MoviePopularModel dataJson;
    if (response.statusCode == 200){
      final dataResponse = jsonDecode(response.body);
      dataJson = MoviePopularModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }

  static Future<TvOnAirModel> getTvOnAir() async {
    var urlString = "${Url.urlGetTVOnTheAir}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    TvOnAirModel dataJson;
    if (response.statusCode == 200){
      final dataResponse = jsonDecode(response.body);
      dataJson = TvOnAirModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }


  static Future<TvPopularModel> getTvPopular() async {
    var urlString = "${Url.urlGetTVPopular}?api_key=$API_KEY";
    var url = Uri.parse(urlString);
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );
    TvPopularModel dataJson;
    if (response.statusCode == 200){
      final dataResponse = jsonDecode(response.body);
      dataJson = TvPopularModel.fromJson(dataResponse);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return dataJson;
  }
  //
  // static Future<DetailDoctorModel> getDoctorDetail(String idDoctor) async {
  //   var url = Uri.parse("${Url.urlDoctorDetail}$idDoctor");
  //   final response = await http.get(
  //     url,
  //     headers: {"Accept": "application/json"},
  //   );
  //   DetailDoctorModel dataJson;
  //   if (response.statusCode == 200){
  //     final dataResponse = jsonDecode(response.body);
  //     print('response: $dataResponse');
  //     dataJson = DetailDoctorModel.fromJson(dataResponse);
  //   } else {
  //     // print(response.body);
  //     throw ('Error ${response.statusCode}');
  //   }
  //   return dataJson;
  // }
}
