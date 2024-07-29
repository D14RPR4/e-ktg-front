import 'package:e_ktg_mobile/presentation/berita/bloc/get_berita/berita_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';
import '../widgets/berita_card.dart';

class BeritaPage extends StatefulWidget {
  final bool showBackButton;
  const BeritaPage({super.key, this.showBackButton = true});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    context.read<BeritaBloc>().add(const BeritaEvent.getAllBerita());
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Berita'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<BeritaBloc, BeritaState>(
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
                    itemBuilder: (context, index) => BeritaCard(
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
