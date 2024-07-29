part of 'desa_bloc.dart';

@freezed
class DesaEvent with _$DesaEvent {
  const factory DesaEvent.started() = _Started;
  const factory DesaEvent.getAllDesa() = _GetAllDesa;
}