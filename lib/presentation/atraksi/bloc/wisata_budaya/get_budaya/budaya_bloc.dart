import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_budaya_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/wisata_budaya_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'budaya_event.dart';
part 'budaya_state.dart';
part 'budaya_bloc.freezed.dart';

class BudayaBloc extends Bloc<BudayaEvent, BudayaState> {
  final WisataBudayaRemoteDatasource wisataBudayaRemoteDatasource;
  BudayaBloc(
    this.wisataBudayaRemoteDatasource,
  ) : super(_Initial()) {
    on<BudayaEvent>((event, emit) async {
      emit(const BudayaState.loading());
      final response = await wisataBudayaRemoteDatasource.getAllBudaya();
      response.fold((l) => emit(BudayaState.error(l)),
          (r) => emit(BudayaState.success(r)));
    });
  }
}
