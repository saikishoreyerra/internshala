import 'package:internshala/data/network/base_api_services.dart';
import 'package:internshala/data/network/network_api_services.dart';
import 'package:internshala/models/movies_model.dart';

import '../models/demo_model.dart';
import '../res/widgets/app_urls.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<MovieListModel> fetchMoviesList() async {
    try {
      print("first line fetchMoviesList function");
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrls.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
