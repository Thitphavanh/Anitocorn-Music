import 'dart:ui';

import 'package:anitocorn_music/const.dart';
import 'package:anitocorn_music/pages/home_page.dart';
import 'package:anitocorn_music/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bgblur.dart';
import '../widgets/current_song.dart';
import '../widgets/custom_bottom_nav.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget body() {
      switch (pageProvider.currentPage) {
        case 0:
          return const HomePage();
        case 1:
          return const Center(
            child: Text(
              "Search",
              style: TextStyle(color: green, fontSize: 32.0),
            ),
          );
        case 2:
          return const Center(
            child: Text(
              "Library",
              style: TextStyle(color: green, fontSize: 32.0),
            ),
          );
        case 3:
          return const Center(
            child: Text(
              "Profile",
              style: TextStyle(color: green, fontSize: 32.0),
            ),
          );

        default:
          return const HomePage();
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: body(),
        bottomNavigationBar: SizedBox(
          height: 120.0,
          child: Stack(
            children: [
              Image.asset(
                'assets/cover/Adele - Easy On Me (Official Lyric Video).jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              BgBlur(
                blur: 10.0,
                opacity: 0.8,
                color: black,
                child: Column(
                  children: const [
                    CurrentSong(),
                    CustomBottomNav(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
