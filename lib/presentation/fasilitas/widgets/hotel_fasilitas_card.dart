import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:e_ktg_mobile/data/model/responses/fasilitas_hotel_response_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ktg_mobile/core/constants/colors.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../detail/fasilitas_hotel_detail_page.dart';

class HotelFasilitasCard extends StatelessWidget {
  final Hotel data;
  const HotelFasilitasCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      data.foto,
      data.foto1,
      data.foto2,
    ];

    return GestureDetector(
      onTap: () {
        context.push(
          FasilitasHotelDetailPage(data: data),
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
              children: imageUrls.map((url) {
                return CachedNetworkImage(
                  imageUrl: url,
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
                );
              }).toList(),
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
