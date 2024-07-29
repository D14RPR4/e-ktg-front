// import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:e_ktg_mobile/data/model/responses/wisata_buatan_response_model.dart';
import 'package:e_ktg_mobile/presentation/atraksi/pages/detail/wisata_buatan_detail.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ktg_mobile/core/constants/colors.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class BuatanWisataCard extends StatelessWidget {
  final Buatan data;
  const BuatanWisataCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          WisataBuatanDetailPage(data: data),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.14),
              blurRadius: 17,
              offset: const Offset(0, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              indicatorColor: AppColors.primary,
              indicatorBackgroundColor: AppColors.white,
              children: [
                CachedNetworkImage(
                  imageUrl: data.foto,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ],
              autoPlayInterval: 0,
              isLoop: false,
            ),
            const SizedBox(height: 10.0),
            Text(
              data.nama,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              data.alamat,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.darkGrey,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
