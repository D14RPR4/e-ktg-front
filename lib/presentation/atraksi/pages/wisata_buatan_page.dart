
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_buatan/get_buatan/buatan_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';
import '../widgets/buatan_wisata_card.dart';

class WisataBuatanPage extends StatefulWidget {
  final bool showBackButton;
  const WisataBuatanPage({super.key, this.showBackButton = true});

  @override
  State<WisataBuatanPage> createState() => _WisataBuatanPageState();
}

class _WisataBuatanPageState extends State<WisataBuatanPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    context.read<BuatanBloc>().add(const BuatanEvent.getAllBuatan());
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Wisata Buatan'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<BuatanBloc, BuatanState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(child: Text('Error'));
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (datas) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: datas.data.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                    itemBuilder: (context, index) => BuatanWisataCard(
                      data: datas.data[index],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
