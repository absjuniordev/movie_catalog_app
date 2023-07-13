import 'package:movie_catolog_app/models/movies_page.dart';
import 'package:movie_catolog_app/repositories/movies_repository.dart';
import 'package:movie_catolog_app/services/dio_service.dart';
import '../utils/apis.utilis.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
