part of 'hotel_bloc.dart';

@freezed
class HotelState with _$HotelState {
  const factory HotelState.initial() = _Initial;
  const factory HotelState.loading() = _Loading;
  const factory HotelState.error(String message) = _Error;
  const factory HotelState.success(FasilitasHotelResponseModel hotel) =
      _Success;
}
