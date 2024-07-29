part of 'alam_bloc.dart';

@freezed
class AlamEvent with _$AlamEvent {
  const factory AlamEvent.started() = _Started;
  const factory AlamEvent.getAllAlam()= _GetAllAlam;
}