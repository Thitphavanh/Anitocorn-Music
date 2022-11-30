import 'package:flutter/material.dart';

import '../const.dart';
import '../models/artists.dart';

class FavArtistIem extends StatelessWidget {
  final ArtistModel artist;
  const FavArtistIem({
    Key? key,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/artist/${artist.image}'),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            artist.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
