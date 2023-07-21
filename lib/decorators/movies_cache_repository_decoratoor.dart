import 'package:movie_catolog_app/decorators/movies_repository_decorator.dart';

import '../models/movies_page.dart';

class MoviesCahceRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCahceRepositoryDecorator(super.moviesRepository);
  @override
  Future<Movies> getMovies() async {
    return super.getMovies();
  }
}
