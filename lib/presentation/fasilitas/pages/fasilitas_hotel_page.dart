import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';
import '../bloc/fasilitas_hotel/get_hotel/hotel_bloc.dart';
import '../widgets/hotel_fasilitas_card.dart';

class FasilitasHotelPage extends StatefulWidget {
  final bool showBackButton;
  const FasilitasHotelPage({super.key, this.showBackButton = true});

  @override
  State<FasilitasHotelPage> createState() => _FasilitasHotelPageState();
}

class _FasilitasHotelPageState extends State<FasilitasHotelPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    context.read<HotelBloc>().add(const HotelEvent.getAllHotel());
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Fasilitas Hotel'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<HotelBloc, HotelState>(
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
                    itemBuilder: (context, index) => HotelFasilitasCard(
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
