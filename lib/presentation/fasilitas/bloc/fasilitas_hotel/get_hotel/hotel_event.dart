part of 'hotel_bloc.dart';

@freezed
class HotelEvent with _$HotelEvent {
  const factory HotelEvent.started() = _Started;
  const factory HotelEvent.getAllHotel()= _GetAllAlam;
}