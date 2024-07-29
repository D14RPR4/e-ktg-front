import 'package:e_ktg_mobile/presentation/fasilitas/bloc/fasilitas_travel/bloc/travel_bloc.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/widgets/travel_fasilitas._card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';


class FasilitasTravelPage extends StatefulWidget {
  final bool showBackButton;
  const FasilitasTravelPage({super.key, this.showBackButton = true});

  @override
  State<FasilitasTravelPage> createState() => _FasilitasTravelPageState();
}

class _FasilitasTravelPageState extends State<FasilitasTravelPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    context.read<TravelBloc>().add(const TravelEvent.getAllTravel());
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Fasilitas Travel'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<TravelBloc, TravelState>(
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
                    itemBuilder: (context, index) => TravelFasilitasCard(
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
