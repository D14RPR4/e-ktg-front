import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../../core/assets/assets.gen.dart';

class BannerHome extends StatefulWidget {
  const BannerHome({super.key});

  @override
  State<BannerHome> createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  final List<AssetImage> images = [
    AssetImage(Assets.images.banner.banner1.path),
    AssetImage(Assets.images.banner.banner2.path),
    AssetImage(Assets.images.banner.banner3.path),
    AssetImage(Assets.images.banner.banner4.path),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.deviceWidth - 208.0,
        width: context.deviceWidth - 10.0,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: images[index],
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: images.length,
          viewportFraction: 0.94,
          scale: 0.5,
          autoplay: true,
          autoplayDelay: 10000,
          pagination: const SwiperPagination(alignment: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
