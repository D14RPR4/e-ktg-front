import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/fasilitas_resto_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/fasilitas_resto_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resto_event.dart';
part 'resto_state.dart';
part 'resto_bloc.freezed.dart';

class RestoBloc extends Bloc<RestoEvent, RestoState> {
  final FasilitasRestoRemoteDatasource fasilitasRestoRemoteDatasource;
  RestoBloc(this.fasilitasRestoRemoteDatasource) : super(_Initial()) {
    on<RestoEvent>((event, emit) async{
      emit(const RestoState.loading());
      final response = await fasilitasRestoRemoteDatasource.getAllResto();
      response.fold(
          (l) => emit(RestoState.error(l)), (r) => emit(RestoState.success(r)));
    });
  }
}
