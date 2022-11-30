// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anitocorn_music/models/packages.dart';
import 'package:anitocorn_music/models/songs.dart';
import 'package:anitocorn_music/pages/package_page.dart';
import 'package:anitocorn_music/providers/package_provider.dart';
import 'package:flutter/material.dart';
import 'package:anitocorn_music/models/artists.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<SongModel> recent = listSongs;
    List<PackageModel> madeForYou = packages;
    List<PackageModel> popularHits = packages.reversed.toList();
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const HomePageHeader(),
          const SizedBox(height: 20.0),
          const HomePageTitle(text: 'Your Favorite artist'),
          const SizedBox(height: 10.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  listArtists.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 10.0, right: 10.0)
                        : const EdgeInsets.only(right: 10.0),
                    child: FavArtistIem(
                      artist: listArtists[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const HomePageTitle(text: 'Recent Played'),
          const SizedBox(height: 10.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  recent.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 10.0, right: 10.0)
                        : const EdgeInsets.only(right: 10.0),
                    child: SongPackageItem(
                      image: 'cover/${recent[index].image}',
                      text: recent[index].title!,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const HomePageTitle(text: 'Made for you'),
          const SizedBox(height: 10.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  madeForYou.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 10.0, right: 10.0)
                        : const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        packageProvider.currentPackage = madeForYou[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PackagePage(),
                          ),
                        );
                      },
                      child: SongPackageItem(
                        image: 'package/${madeForYou[index].image}',
                        text: madeForYou[index].name!,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const HomePageTitle(text: 'Popular Hits'),
          const SizedBox(height: 10.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  popularHits.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 10.0, right: 10.0)
                        : const EdgeInsets.only(right: 10.0),
                    child: SongPackageItem(
                      image: 'package/${popularHits[index].image}',
                      text: popularHits[index].name!,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
