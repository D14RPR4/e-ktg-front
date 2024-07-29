part of 'kalender_bloc.dart';

@freezed
class KalenderEvent with _$KalenderEvent {
  const factory KalenderEvent.started() = _Started;
  const factory KalenderEvent.getAllKalender() = _GetAllKalender;
}