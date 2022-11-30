import 'package:flutter/material.dart';

import '../const.dart';

class CurrentSong extends StatelessWidget {
  const CurrentSong({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 60.0,
      child: Row(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: AssetImage(
                  'assets/cover/Adele - Easy On Me (Official Lyric Video).jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Easy On Me',
                  style: TextStyle(
                    color: white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Adele',
                  style: TextStyle(
                    color: white,
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: white,
            ),
          ),
          SizedBox(
            width: 24.0,
            height: 24.0,
            child: Stack(
              alignment: Alignment.center,
              children: const [
                CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(red),
                  value: 0.5,
                  strokeWidth: 2.0,
                ),
                Icon(
                  Icons.play_arrow_rounded,
                  color: white,
                  size: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


