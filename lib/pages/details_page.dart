import 'package:flutter/material.dart';
import '../models/movies_page.dart';
import '../utils/apis.utilis.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title.toString(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height * .55,
                child: Image.network(
                  API.REQUEST_IMG(movie.posterPath.toString()),
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) return child;
                    return const CircularProgressIndicator.adaptive();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.overview.toString(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.title),
                  Text(movie.originalTitle.toString()),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.new_releases),
                  Text(movie.releaseDate.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
