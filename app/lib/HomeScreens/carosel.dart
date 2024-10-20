import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carosel extends StatefulWidget {
  const Carosel({super.key});

  @override
  State<Carosel> createState() => _CaroselState();
}

class _CaroselState extends State<Carosel> {
  final pictures = [
    "assets/Card.png",
    "assets/banner3.jpg",
    "assets/banner.jpg",
    "assets/banner4.jpg",
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: pictures.length,
            itemBuilder: (context, index, realIndex) {
              final image = pictures[index];
              return buildImage(image, index);
            },
            options: CarouselOptions(
              height: 193,
              autoPlay: true,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 2),
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) => setState(() {
                currentindex = index;
              }),
            )),
        SizedBox(
          height: 20,
        ),
        buildindicator(),
      ],
    );
  }

  Widget buildImage(String image, int index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Color(0xff1D102D),
        ),
        // margin: EdgeInsets.symmetric(horizontal: 8),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      );
  Widget buildindicator() => AnimatedSmoothIndicator(
        activeIndex: currentindex,
        count: pictures.length,
        effect: JumpingDotEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.white,
            activeDotColor: Color.fromARGB(255, 156, 88, 240)),
      );
}
