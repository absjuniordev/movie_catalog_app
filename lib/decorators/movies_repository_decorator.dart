import 'dart:convert';

import 'package:movie_catolog_app/models/movies_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;

  MoviesRepositoryDecorator(this._moviesRepository);
  @override
  Future<Movies> getMovies() async {
    return await _moviesRepository.getMovies();
  }

  _saveInCache(Movies movies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode((movies.toJson()));
    prefs.setString('movies_cache', jsonMovies);
  }

  Future<Movies> _getInCahce() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJsonString);

    return Movies.fromJson(json);
  }
}
