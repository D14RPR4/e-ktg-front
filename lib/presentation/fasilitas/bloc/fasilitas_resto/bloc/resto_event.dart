part of 'resto_bloc.dart';

@freezed
class RestoEvent with _$RestoEvent {
  const factory RestoEvent.started() = _Started;
  const factory RestoEvent.getAllResto()= _GetAllResto;
}