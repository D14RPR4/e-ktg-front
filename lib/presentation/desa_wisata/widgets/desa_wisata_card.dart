import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ktg_mobile/data/model/responses/desa_response_model.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/colors.dart';

class DesaWisataCard extends StatelessWidget {
  final Desa data;
  const DesaWisataCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Uri _linkJadesta = Uri.parse(data.linkJadesta);
    Uri _linkWisata = Uri.parse(data.linkWisata);

    Future<void> _launchUrl(Uri url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    // Menghitung padding berdasarkan ukuran layar
    final double buttonPaddingVertical =
        MediaQuery.of(context).size.height * 0.02;

    return Container(
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
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlideshow(
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: const Color.fromARGB(255, 77, 138, 240),
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              CachedNetworkImage(
                imageUrl: data.foto1,
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              CachedNetworkImage(
                imageUrl: data.foto2,
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
            autoPlayInterval: 0,
            isLoop: true,
          ),
          const SizedBox(height: 10.0),
          Text(
            data.namaDesaWisata,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            data.deskripsi,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkGrey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _launchUrl(_linkJadesta),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primary,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: buttonPaddingVertical,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Informasi'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _launchUrl(_linkWisata),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 0, 132, 255),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: buttonPaddingVertical,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Video'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
