import '../models/movies_page.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}
