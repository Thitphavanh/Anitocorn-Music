import 'package:flutter/material.dart';

import '../const.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello Bambang',
                  style: TextStyle(
                      color: white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Let\'s listen to something cool today',
                  style: TextStyle(
                    color: white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: white,
                ),
                Positioned(
                  top: 5.0,
                  right: 5.0,
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: const BoxDecoration(
                      color: red,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}