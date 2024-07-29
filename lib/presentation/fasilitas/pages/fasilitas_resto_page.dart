import 'package:e_ktg_mobile/presentation/fasilitas/bloc/fasilitas_resto/bloc/resto_bloc.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/widgets/resto_fasilitas_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';


class FasilitasRestolPage extends StatefulWidget {
  final bool showBackButton;
  const FasilitasRestolPage({super.key, this.showBackButton = true});

  @override
  State<FasilitasRestolPage> createState() => _FasilitasRestolPageState();
}

class _FasilitasRestolPageState extends State<FasilitasRestolPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    context.read<RestoBloc>().add(const RestoEvent.getAllResto());
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Fasilitas Resto'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<RestoBloc, RestoState>(
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
                    itemBuilder: (context, index) => RestoFasilitasCard(
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
