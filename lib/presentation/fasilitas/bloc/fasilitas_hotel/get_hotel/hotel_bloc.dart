import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/fasilitas_hotel_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/fasilitas_hotel_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';
part 'hotel_bloc.freezed.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final FasilitasHotelRemoteDatasource fasilitasHotelRemoteDatasource;
  HotelBloc(
    this.fasilitasHotelRemoteDatasource,
  ) : super(_Initial()) {
    on<HotelEvent>((event, emit) async {
      emit(const HotelState.loading());
      final response = await fasilitasHotelRemoteDatasource.getAllHotel();
      response.fold(
          (l) => emit(HotelState.error(l)), (r) => emit(HotelState.success(r)));
    });
  }
}
