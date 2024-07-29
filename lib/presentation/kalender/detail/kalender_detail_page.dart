import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_ktg_mobile/core/constants/colors.dart';

import 'package:e_ktg_mobile/data/model/responses/kalender_wisata_response_model.dart';
import 'package:e_ktg_mobile/presentation/kalender/bloc/bloc/kalender_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/components/custom_scaffold.dart';

class KalenderDetailPage extends StatefulWidget {
  final Kalender data;

  const KalenderDetailPage({super.key, required this.data});

  @override
  State<KalenderDetailPage> createState() => _KalenderDetailPageState();
}

class _KalenderDetailPageState extends State<KalenderDetailPage> {
  Future<void> _refreshKalender() async {
    context.read<KalenderBloc>().add(KalenderEvent.getAllKalender());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KalenderBloc, KalenderState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => _buildContent(context, widget.data),
          success: (kalenderList) {
            final updatedData = kalenderList.data.firstWhere(
              (element) => element.id == widget.data.id,
              orElse: () => widget.data,
            );
            return _buildContent(context, updatedData);
          },
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, Kalender data) {
    Uri _linkEvent = Uri.parse(data.eventWisatas.first.linkEvent);
    Future<void> _launchUrl() async {
      if (!await launchUrl(_linkEvent)) {
        throw Exception('Could not launch ');
      }
    }

    final List<String> imageUrls = [
      data.eventWisatas.first.foto,
      data.eventWisatas.first.foto1,
      data.eventWisatas.first.foto2,
    ];

    return CustomScaffold(
      appBarTitle: Text(
        data.nama,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshKalender,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
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
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.blue),
                                backgroundColor: Colors.grey[300],
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        );
                      }).toList(),
                      autoPlayInterval: 0,
                      isLoop: false,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    data.eventWisatas.first.nama,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20.0),
                  _buildInfoSection(data),
                  const SizedBox(height: 5.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _launchUrl,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 0, 132, 255),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text('Buka Link YouTube'),
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

  Widget _buildInfoSection(Kalender data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'INFORMASI',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10.0),
        _buildInfoTile(
            Icons.description, 'Deskripsi', data.eventWisatas.first.deskripsi),
        _buildInfoTile(Icons.person, 'Penyelenggara Event',
            data.eventWisatas.first.penyelenggaraEvent),
        _buildInfoTile(Icons.place, 'Tempat', data.eventWisatas.first.tempat),
        _buildInfoTile(
            Icons.date_range, 'Tanggal', data.eventWisatas.first.tanggal),
        _buildInfoTile(Icons.directions_bus, 'Transportasi',
            data.eventWisatas.first.transportasi),
        _buildInfoTile(
            Icons.photo, 'Sumber Foto', data.eventWisatas.first.sumberFoto),
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
            offset: const Offset(0, 3),
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
          const SizedBox(width: 10),
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
