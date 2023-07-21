import 'dart:convert';

import 'package:movie_catolog_app/decorators/movies_repository_decorator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/movies_page.dart';

class MoviesCahceRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCahceRepositoryDecorator(super.moviesRepository);

  @override
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCahce();
    }
  }

  _saveInCache(Movies movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode((movies.toJson()));
    prefs.setString('movies_cache', jsonMovies);
  }

  Future<Movies> _getInCahce() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = Movies.fromJson(json);

    return movies;
  }
}
