import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_catolog_app/controllers/movie_controller.dart';
import 'package:movie_catolog_app/models/movies_page.dart';
import 'package:movie_catolog_app/repositories/movies_repository_imp.dart';
import 'package:movie_catolog_app/services/dio_service_imp.dart';
import '../widgets/cusotm_listt_card_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (__, movies, _) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      children: [
                        Text(
                          'Movies',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          onChanged: _controller.onChanged,
                        )
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<Movies?>(
                //movies sera quem iremos observar
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) => const Divider(),
                          shrinkWrap: true,
                          itemCount: movies.listOfMovies!.length,
                          itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.listOfMovies![idx]),
                        )
                      : Lottie.asset('assets/lottie.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
