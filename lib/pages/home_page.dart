import 'package:flutter/material.dart';
import 'package:movie_catolog_app/controllers/movie_controller.dart';
import 'package:movie_catolog_app/models/movies_page.dart';
import 'package:movie_catolog_app/repositories/movies_repository_imp.dart';
import 'package:movie_catolog_app/services/dio_service_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );
  //Depencecia = quem for usar o MovieController tera que implementar o
  // MovieRepositoryImp que implementara o DioServiceImp

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<Movies?>(
      //movies sera quem iremos observar
      valueListenable: _controller.movies,
      builder: (_, movies, __) {
        return movies != null
            ? ListView.builder(
                itemCount: movies.listOfMovies!.length,
                itemBuilder: (_, idx) =>
                    Text(movies.listOfMovies![idx].title.toString()),
              )
            : Container();
      },
    ));
  }
}
