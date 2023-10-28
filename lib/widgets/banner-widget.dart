// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kapda_bazzar/controlers/banners-controler.dart';

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  final CarouselController carouselController = CarouselController();
  final BannersControlers bannersControlers = Get.put(BannersControlers());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CarouselSlider(
        items: bannersControlers.bannersUrl
            .map(
              (imageUrls) => ClipRRect(
                // borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageUrls,
                  fit: BoxFit.cover,
                  width: Get.width,
                  placeholder: (context, url) => const ColoredBox(
                    color: Colors.white,
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ).toList(),
          options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          aspectRatio: 2.5,
          viewportFraction: 1,
        ),
      );
    });
  }
}
