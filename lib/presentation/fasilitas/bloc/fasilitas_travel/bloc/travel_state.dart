part of 'travel_bloc.dart';

@freezed
class TravelState with _$TravelState {
  const factory TravelState.initial() = _Initial;
  const factory TravelState.loading() = _Loading;
  const factory TravelState.error(String message) = _Error;
  const factory TravelState.success(FasilitasTravelResponseModel travel) =
      _Success;
}
