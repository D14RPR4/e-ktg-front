part of 'budaya_bloc.dart';

@freezed
class BudayaEvent with _$BudayaEvent {
  const factory BudayaEvent.started() = _Started;
  const factory BudayaEvent.getAllBudaya() = _GetAllBudaya;
}
