import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_buatan_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/wisata_buatan_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'buatan_event.dart';
part 'buatan_state.dart';
part 'buatan_bloc.freezed.dart';

class BuatanBloc extends Bloc<BuatanEvent, BuatanState> {
  final WisataBuatanRemoteDatasource wisataBuatanRemoteDatasource;
  BuatanBloc(
    this.wisataBuatanRemoteDatasource,
  ) : super(_Initial()) {
    on<BuatanEvent>((event, emit) async {
      emit(const BuatanState.loading());
      final response = await wisataBuatanRemoteDatasource.getAllBuatan();
      response.fold((l) => emit(BuatanState.error(l)),
          (r) => emit(BuatanState.success(r)));
    });
  }
}
