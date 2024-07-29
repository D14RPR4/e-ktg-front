part of 'buatan_bloc.dart';

@freezed
class BuatanState with _$BuatanState {
  const factory BuatanState.initial() = _Initial;
  const factory BuatanState.loading() = _Loading;
  const factory BuatanState.error(String message) = _Error;
  const factory BuatanState.success(WisataBuatanResponseModel buatan) =
      _Success;
}
