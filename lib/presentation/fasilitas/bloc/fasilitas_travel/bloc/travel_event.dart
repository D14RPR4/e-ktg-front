part of 'travel_bloc.dart';

@freezed
class TravelEvent with _$TravelEvent {
  const factory TravelEvent.started() = _Started;
  const factory TravelEvent.getAllTravel()= _GetAllTravel;
}