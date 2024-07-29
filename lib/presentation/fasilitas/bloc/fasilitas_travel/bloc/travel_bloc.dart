import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/fasilitas_travel_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/fasilitas_travel_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_event.dart';
part 'travel_state.dart';
part 'travel_bloc.freezed.dart';

class TravelBloc extends Bloc<TravelEvent, TravelState> {
  final FasilitasTravelRemoteDatasource fasilitasTravelRemoteDatasource;
  TravelBloc(this.fasilitasTravelRemoteDatasource) : super(_Initial()) {
    on<TravelEvent>((event, emit) async {
      emit(const TravelState.loading());
      final response = await fasilitasTravelRemoteDatasource.getAllTravel();
      response.fold((l) => emit(TravelState.error(l)),
          (r) => emit(TravelState.success(r)));
    });
  }
}
