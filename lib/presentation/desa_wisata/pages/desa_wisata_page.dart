import 'package:e_ktg_mobile/presentation/desa_wisata/bloc/desa_wisata/desa_bloc.dart';
import 'package:e_ktg_mobile/presentation/desa_wisata/widgets/desa_wisata_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';

class DesaWisataPage extends StatefulWidget {
  final bool showBackButton;
  const DesaWisataPage({super.key, this.showBackButton = true});

  @override
  State<DesaWisataPage> createState() => _DesaWisataPageState();
}

class _DesaWisataPageState extends State<DesaWisataPage> {
  @override
  void initState() {
    context.read<DesaBloc>().add(const DesaEvent.getAllDesa());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Desa Wisata'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<DesaBloc, DesaState>(
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
                    itemBuilder: (context, index) => DesaWisataCard(
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
