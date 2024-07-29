import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ktg_mobile/core/constants/colors.dart';
import 'package:e_ktg_mobile/data/model/responses/berita_response_model.dart';
import 'package:e_ktg_mobile/presentation/berita/bloc/get_berita/berita_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../../../../core/components/custom_scaffold.dart';

class BeritaDetailPage extends StatefulWidget {
  final Berita data;

  const BeritaDetailPage({super.key, required this.data});

  @override
  State<BeritaDetailPage> createState() => _BeritaDetailPageState();
}

class _BeritaDetailPageState extends State<BeritaDetailPage> {
  Future<void> _refreshBerita() async {
    context.read<BeritaBloc>().add(BeritaEvent.getAllBerita());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeritaBloc, BeritaState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => _buildContent(context, widget.data),
          success: (beritaList) {
            final updatedData = beritaList.data.firstWhere(
              (element) => element.id == widget.data.id,
              orElse: () => widget.data,
            );
            return _buildContent(context, updatedData);
          },
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, Berita data) {
    return CustomScaffold(
      appBarTitle: Text(
        'Detail Berita',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshBerita,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      data.judul,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: ImageSlideshow(
                      width: double.infinity,
                      height: 250,
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primary),
                                backgroundColor: Colors.grey[300],
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ],
                      autoPlayInterval: 3000,
                      isLoop: false,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.createdAt.toString().substring(0, 16),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          data.deskripsi,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.darkGrey,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
