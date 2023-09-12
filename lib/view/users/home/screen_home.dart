import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trappra_chat/model/colors/colors.dart';
import 'package:trappra_chat/model/const/const.dart';
import 'package:trappra_chat/view/admin/home/admin_home.dart';
import '../../../controller/goto_user.dart';
import '../../../controller/provider/home_provider.dart';
import '../../../model/user/home/home_widgets.dart';

final CarouselController carouselController = CarouselController();

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers

    final newindex = Provider.of<ImageChangingProvider>(context);
    final currentIndex = newindex.currentIndex;
    final now = DateTime.now();
    String currentTime;
    if (now.hour < 12) {
      currentTime = "Good Morning";
    } else if (now.hour < 17) {
      currentTime = "Good Afternoon";
    } else {
      currentTime = "Good Evening";
    }
    return Scaffold(
      backgroundColor: kBackground,
      body: Builder(
        builder: (BuildContext context) {
          return OfflineBuilder(
            connectivityBuilder: (BuildContext context,
                ConnectivityResult connectivity, Widget child) {
              final bool connected = connectivity != ConnectivityResult.none;
              return Stack(
                fit: StackFit.expand,
                children: [
                  child,
                  Positioned(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      color: connected ? null : kWhite,
                      child: connected
                          ? null
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "You Are Offline",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 400,
                                  child: Image.asset("assets/offline3.gif"),
                                ),
                                const Text(
                                  "No Internet Connection found\nCheck your connection and try again",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              );
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Challengers News",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FutureBuilder<BannerModel>(
                        future: fetchBanners(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Shimmer.fromColors(
                              baseColor: kgrey,
                              highlightColor: kHighlight,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kWhite,
                                ),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 4,
                                // Color of the content
                              ),
                            );
                          } else if (snapshot.hasData) {
                            final bannerPath = snapshot.data;
                            final List<dynamic> images =
                                bannerPath!.bannerImages;
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: kField2,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CarouselSlider(
                                      items: images
                                          .map(
                                            (item) => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                item,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    4,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      carouselController: carouselController,
                                      options: CarouselOptions(
                                        scrollPhysics:
                                            const BouncingScrollPhysics(),
                                        autoPlay: true,
                                        autoPlayInterval: const Duration(
                                          seconds: 10,
                                        ),
                                        aspectRatio: 2,
                                        viewportFraction: 1,
                                        onPageChanged: (index, reason) {
                                          newindex.indexChanging(index);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: images.asMap().entries.map(
                                      (entry) {
                                        return GestureDetector(
                                          onTap: () => carouselController
                                              .animateToPage(entry.key),
                                          child: Container(
                                            width: currentIndex == entry.key
                                                ? 20
                                                : 10,
                                            height: 10,
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 3,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: currentIndex == entry.key
                                                  ? kBlack
                                                  : kWhite,
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                )
                              ],
                            );
                          } else {
                            return Shimmer.fromColors(
                              baseColor:
                                  Colors.grey, // Color when not shimmering
                              highlightColor: kHighlight,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kWhite,
                                ),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 4,
                                // Color of the content
                              ),
                            );
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            color: kField2,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                currentTime,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Students",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GridView(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          children: [
                            GestureDetector(
                              onTap: () => gotoKidsScreen(context),
                              child: const StudentsAgeDiff2(
                                title2: "S",
                                image: 'assets/kids.jpg',
                                title: 'Kid',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => gotoUnder13Screen(context),
                              child: const StudentsAgeDiff(
                                image: 'assets/under12.jpg',
                                age: '1',
                                age2: '3',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => gotoUnder15Screen(context),
                              child: const StudentsAgeDiff(
                                image: 'assets/under15.jpg',
                                age2: '5',
                                age: '1',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => gotoUnder18Screen(context),
                              child: const StudentsAgeDiff(
                                image: 'assets/ootball.jpg',
                                age: '1',
                                age2: '8',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => gotoUnder20Screen(context),
                              child: const StudentsAgeDiff(
                                image: 'assets/under20.jpg',
                                age: '2',
                                age2: '0',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => gotoGkScreen(context),
                              child: const StudentsAgeDiff2(
                                image: 'assets/footballlll.jpg',
                                title: 'G',
                                title2: 'K',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const MyHsizedBox(h: 20),
                    GestureDetector(
                      onTap: () {
                        gotoRulesScreen(context);
                      },
                      child: const ExtraContainers(
                        icon: Icon(Icons.featured_play_list_outlined),
                        text: "Rules & Regulations",
                      ),
                    ),
                    const MyHsizedBox(h: 20),
                    GestureDetector(
                      onTap: () {
                        gotoSettingsScreen(context);
                      },
                      child: const ExtraContainers(
                        icon: Icon(Icons.settings_suggest_outlined),
                        text: "Settings",
                        // functions: () {},
                      ),
                    ),
                    const MyHsizedBox(h: 20),
                    const Center(
                      child: CostomeBottomSheet(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Center(
                      child: Text(
                        "Challengers Football Academy",
                        style: TextStyle(
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Center(
                      child: Text(
                        "Thiruvegappura",
                        style: TextStyle(
                          color: kBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    // ElevatedButton(onPressed: onPressed, child: child)
  }
}
