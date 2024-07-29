import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/desa_remote_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/responses/desa_response_model.dart';

part 'desa_event.dart';
part 'desa_state.dart';
part 'desa_bloc.freezed.dart';

class DesaBloc extends Bloc<DesaEvent, DesaState> {
  final DesaRemoteDatasource desaRemoteDatasource;
  DesaBloc(
    this.desaRemoteDatasource,
  ) : super(const _Initial()) {
    on<DesaEvent>((event, emit) async{
      emit(const DesaState.loading());
      final response = await desaRemoteDatasource.getAllDesa();
      response.fold((l) => emit(DesaState.error(l)), (r) => emit(DesaState.success(r)));
    });
  }
}
