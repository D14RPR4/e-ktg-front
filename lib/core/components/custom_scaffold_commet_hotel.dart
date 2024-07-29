import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';

import 'package:e_ktg_mobile/presentation/fasilitas/bloc/fasilitas_resto/bloc/resto_bloc.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/bloc/fasilitas_travel/bloc/travel_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../presentation/fasilitas/bloc/fasilitas_hotel/get_hotel/hotel_bloc.dart';
import '../constants/colors.dart';

class CustomScaffoldHotel extends StatelessWidget {
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final double toolbarHeight;

  const CustomScaffoldHotel({
    super.key,
    this.appBarTitle,
    this.actions,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showBackButton = true,
    this.toolbarHeight = 55.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        leading: showBackButton
            ? BlocConsumer<HotelBloc, HotelState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (Hotel) {
                      Future.microtask(() => context.pop());
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => IconButton(
                      onPressed: () {
                        context.read<HotelBloc>().add(HotelEvent.getAllHotel());
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        color: AppColors.white,
                        size: 32.0,
                      ),
                    ),
                  );
                },
              )
            : null,
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: appBarTitle,
        actions: actions,
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
          color: AppColors.white,
        ),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class CustomScaffoldResto extends StatelessWidget {
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final double toolbarHeight;

  const CustomScaffoldResto({
    super.key,
    this.appBarTitle,
    this.actions,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showBackButton = true,
    this.toolbarHeight = 55.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        leading: showBackButton
            ? BlocConsumer<RestoBloc, RestoState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (Resto) {
                      Future.microtask(() => context.pop());
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => IconButton(
                      onPressed: () {
                        context
                            .read<RestoBloc>()
                            .add(RestoEvent.getAllResto());
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        color: AppColors.white,
                        size: 32.0,
                      ),
                    ),
                  );
                },
              )
            : null,
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: appBarTitle,
        actions: actions,
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
          color: AppColors.white,
        ),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class CustomScaffoldTravel extends StatelessWidget {
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final double toolbarHeight;

  const CustomScaffoldTravel({
    super.key,
    this.appBarTitle,
    this.actions,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showBackButton = true,
    this.toolbarHeight = 55.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        leading: showBackButton
            ? BlocConsumer<TravelBloc, TravelState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (Travel) {
                      Future.microtask(() => context.pop());
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => IconButton(
                      onPressed: () {
                        context
                            .read<TravelBloc>()
                            .add(TravelEvent.getAllTravel());
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        color: AppColors.white,
                        size: 32.0,
                      ),
                    ),
                  );
                },
              )
            : null,
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: appBarTitle,
        actions: actions,
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
          color: AppColors.white,
        ),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
