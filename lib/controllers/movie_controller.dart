import 'package:flutter/material.dart';
import '../models/movies_page.dart';
import '../repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;

  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  //vai ser carregado mas em um momento secundario

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
  }
}
