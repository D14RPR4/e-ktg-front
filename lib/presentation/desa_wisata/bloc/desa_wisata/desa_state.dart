part of 'desa_bloc.dart';

@freezed
class DesaState with _$DesaState {
  const factory DesaState.initial() = _Initial;
  const factory DesaState.loading() = _Loading;
  const factory DesaState.error(String message) = _Error;
  const factory DesaState.success(DesaWisataResponseModel desa) =
      _Success;
}
