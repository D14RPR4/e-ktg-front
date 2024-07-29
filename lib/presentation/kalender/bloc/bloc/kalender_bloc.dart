import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/kalender_event_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/kalender_wisata_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kalender_event.dart';
part 'kalender_state.dart';
part 'kalender_bloc.freezed.dart';

class KalenderBloc extends Bloc<KalenderEvent, KalenderState> {
  final KalenderEventRemoteDatasource kalenderEventRemoteDatasource;
  KalenderBloc(
    this.kalenderEventRemoteDatasource,
  ) : super(_Initial()) {
    on<KalenderEvent>((event, emit) async {
      emit(const KalenderState.loading());
      final response = await kalenderEventRemoteDatasource.getAllKalender();
      response.fold((l) => emit(KalenderState.error(l)),
          (r) => emit(KalenderState.success(r)));
    });
  }
}
