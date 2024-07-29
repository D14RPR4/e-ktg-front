import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_alam_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/wisata_alam_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alam_event.dart';
part 'alam_state.dart';
part 'alam_bloc.freezed.dart';

class AlamBloc extends Bloc<AlamEvent, AlamState> {
  final WisataAlamRemoteDatasource wisataAlamRemoteDatasource;
  AlamBloc(
    this.wisataAlamRemoteDatasource,
  ) : super(_Initial()) {
    on<AlamEvent>((event, emit) async {
      emit(const AlamState.loading());
      final response = await wisataAlamRemoteDatasource.getAllAlam();
      response.fold(
          (l) => emit(AlamState.error(l)), (r) => emit(AlamState.success(r)));
    });
  }
}
