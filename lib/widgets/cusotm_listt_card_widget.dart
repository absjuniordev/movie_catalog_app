import 'package:flutter/material.dart';
import 'package:movie_catolog_app/pages/details_page.dart';
import '../models/movies_page.dart';
import '../utils/apis.utilis.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsPage(movie: movie),
                fullscreenDialog: true),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Hero(
                  tag: movie.id!,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath.toString()),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title.toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Spacer(),
                      Text('Polularidade: ${movie.popularity} '),
                      Text('Votos: ${movie.voteAverage} '),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
