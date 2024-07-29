import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ktg_mobile/core/constants/colors.dart';
import 'package:e_ktg_mobile/core/constants/like_comment_button.dart';
import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:e_ktg_mobile/data/model/responses/wisata_buatan_response_model.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/like/like_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_buatan/get_buatan/buatan_bloc.dart';

import 'package:e_ktg_mobile/presentation/atraksi/pages/detail/comment/comment_buatan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../../../../core/components/custom_scaffold.dart';

class WisataBuatanDetailPage extends StatefulWidget {
  final Buatan data;

  const WisataBuatanDetailPage({super.key, required this.data});

  @override
  State<WisataBuatanDetailPage> createState() => _WisataBuatanDetailPageState();
}

class _WisataBuatanDetailPageState extends State<WisataBuatanDetailPage> {
  void _handlePostLikeDislike(BuildContext context, String postId) {
    context.read<LikeBloc>().add(LikeEvent.like(postId));
  }

  Future<void> _refreshBuatan() async {
    context.read<BuatanBloc>().add(BuatanEvent.getAllBuatan());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LikeBloc, LikeState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          success: (datas) {
            context.read<BuatanBloc>().add(BuatanEvent.getAllBuatan());
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<BuatanBloc, BuatanState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => _buildContent(context, widget.data),
            success: (buatanList) {
              final updatedData = buatanList.data.firstWhere(
                (element) => element.id == widget.data.id,
                orElse: () => widget.data,
              );
              return _buildContent(context, updatedData);
            },
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, Buatan data) {
    return CustomScaffold(
      appBarTitle: Text(data.nama),
      body: RefreshIndicator(
        onRefresh: _refreshBuatan,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(38),
                    ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      kLikeAndComment(
                        data.likeAtraksiCount,
                        data.selfLiked == true
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        data.selfLiked == true
                            ? Colors.red
                            : AppColors.darkGrey,
                        () {
                          if (data.selfLiked != null) {
                            _handlePostLikeDislike(context, data.id);
                          }
                        },
                      ),
                      SizedBox(width: 8),
                      kLikeAndComment(
                        data.commentAtraksiCount,
                        Icons.sms_outlined,
                        AppColors.darkGrey,
                        () {
                          context.push(
                            CommentBuatanPage(
                              postId: data.id,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    data.nama,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    data.alamat,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGrey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20.0),
                  _buildInfoSection(data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(Buatan data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'INFORMASI',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10.0),
        _buildInfoTile(Icons.landscape, 'Atraksi Wisata', data.atraksiWisata),
        _buildInfoTile(Icons.home, 'Fasilitas', data.fasilitas),
        _buildInfoTile(Icons.place, 'Destinasi', data.destinasi),
        _buildInfoTile(Icons.description, 'Deskripsi', data.deskripsi),
        _buildInfoTile(Icons.person, 'Nama Pengelola', data.namaPengelola),
        _buildInfoTile(Icons.phone, 'No Pengelola', data.noPengelola),
        _buildInfoTile(Icons.calendar_today, 'Hari Buka', data.hariBuka),
        _buildInfoTile(Icons.access_time, 'Jam Buka', data.jamBuka),
        _buildInfoTile(Icons.access_time, 'Jam Tutup', data.jamTutup),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGrey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
