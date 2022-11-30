import 'package:anitocorn_music/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    return Container(
      height: 60.0,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: red,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icons.length,
          (index) => GestureDetector(
            onTap: () {
              pageProvider.currentPage = index;
            },
            child: SizedBox(
              height: 40.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: pageProvider.currentPage == index ? 24.0 : 0.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: pageProvider.currentPage == index ? red : white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  Icon(
                    icons[index],
                    color: pageProvider.currentPage == index ? red : white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
