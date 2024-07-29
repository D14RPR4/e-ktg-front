import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';
import '../bloc/wisata_budaya/get_budaya/budaya_bloc.dart';

import '../widgets/budaya_wisata_card.dart';

class WisataBudayaPage extends StatefulWidget {
  final bool showBackButton;
  const WisataBudayaPage({super.key, this.showBackButton = true});

  @override
  State<WisataBudayaPage> createState() => _WisataBudayaPageState();
}

class _WisataBudayaPageState extends State<WisataBudayaPage> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    context.read<BudayaBloc>().add(const BudayaEvent.getAllBudaya());
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Wisata Budaya'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<BudayaBloc, BudayaState>(
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
                    itemBuilder: (context, index) => BudayaWisataCard(
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
