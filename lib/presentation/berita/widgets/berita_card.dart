import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:e_ktg_mobile/data/model/responses/berita_response_model.dart';
import 'package:e_ktg_mobile/presentation/berita/detail/berita_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:e_ktg_mobile/core/constants/colors.dart';

class BeritaCard extends StatelessWidget {
  final Berita data;
  const BeritaCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          BeritaDetailPage(data: data),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.judul,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12.0),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  data.foto,
                  width: 500.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 200.0);
                  },
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              data.createdAt.toString().substring(0, 16),
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              data.deskripsi,
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
