import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/get_alam/alam_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/widgets/alam_wisata_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';

class WisataAlamPage extends StatefulWidget {
  final bool showBackButton;
  const WisataAlamPage({super.key, this.showBackButton = true});

  @override
  State<WisataAlamPage> createState() => _WisataAlamPageState();
}

class _WisataAlamPageState extends State<WisataAlamPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    context.read<AlamBloc>().add(const AlamEvent.getAllAlam());
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Wisata Alam'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<AlamBloc, AlamState>(
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
                    itemBuilder: (context, index) => AlamWisataCard(
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
