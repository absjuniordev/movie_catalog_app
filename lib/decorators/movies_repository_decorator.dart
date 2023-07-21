import 'package:movie_catolog_app/models/movies_page.dart';
import '../repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;

  MoviesRepositoryDecorator(this._moviesRepository);
  @override
  Future<Movies> getMovies() async {
    return await _moviesRepository.getMovies();
  }
}
