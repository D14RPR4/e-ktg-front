part of 'buatan_bloc.dart';

@freezed
class BuatanEvent with _$BuatanEvent {
  const factory BuatanEvent.started() = _Started;
  const factory BuatanEvent.getAllBuatan() = _GetAllBuatan;
}
