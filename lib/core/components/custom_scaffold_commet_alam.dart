import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/get_alam/alam_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/atraksi/bloc/wisata_buatan/get_buatan/buatan_bloc.dart';
import '../../presentation/atraksi/bloc/wisata_budaya/get_budaya/budaya_bloc.dart';

import '../constants/colors.dart';

class CustomScaffoldAlam extends StatelessWidget {
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final double toolbarHeight;

  const CustomScaffoldAlam({
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
            ? BlocConsumer<AlamBloc, AlamState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (alam) {
                      Future.microtask(() => context.pop());
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => IconButton(
                      onPressed: () {
                        context.read<AlamBloc>().add(AlamEvent.getAllAlam());
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

class CustomScaffoldBuatan extends StatelessWidget {
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final double toolbarHeight;

  const CustomScaffoldBuatan({
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
            ? BlocConsumer<BuatanBloc, BuatanState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (buatan) {
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
                            .read<BuatanBloc>()
                            .add(BuatanEvent.getAllBuatan());
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

class CustomScaffoldBudaya extends StatelessWidget {
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final double toolbarHeight;

  const CustomScaffoldBudaya({
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
            ? BlocConsumer<BudayaBloc, BudayaState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (budaya) {
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
                            .read<BudayaBloc>()
                            .add(BudayaEvent.getAllBudaya());
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
