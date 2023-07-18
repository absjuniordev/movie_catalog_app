import 'package:flutter/material.dart';
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
    return Container(
      height: 200,
      decoration: const BoxDecoration(color: Colors.black54),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            API.REQUEST_IMG(movie.posterPath.toString()),
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
    );
  }
}
