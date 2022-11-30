import 'package:anitocorn_music/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/packages.dart';
import '../providers/providers.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border_rounded,
              // color: white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              // color: white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width + 30.0,
            child: Stack(
              children: [
                Image.asset(
                  'assets/package/${packageProvider.currentPackage!.image}',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          packageProvider.currentPackage!.name!,
                          style: const TextStyle(
                            color: white,
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: grey,
                                  size: 12.0,
                                ),
                                const SizedBox(width: 5.0),
                                Text(
                                  '${packageProvider.totalLikes()} Likes',
                                  style: const TextStyle(
                                    color: grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10.0),
                            Row(
                              children: const [
                                Icon(
                                  Icons.timer,
                                  color: grey,
                                  size: 12.0,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  '2h 30m',
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: red,
                              ),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                // color: red,
                                size: 52.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Featuring',
              style: TextStyle(
                color: white,
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ...List.generate(
                    packageProvider.currentPackage!.songs!.length,
                    (index) {
                      var data = packageProvider.currentPackage!.songs![index];

                      return Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(top: 0.0)
                            : const EdgeInsets.only(top: 10.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/cover/${data.image}'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title!,
                                      style: const TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      data.singer!,
                                      style: const TextStyle(
                                          color: white, fontSize: 12.0),
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
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert_rounded,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
