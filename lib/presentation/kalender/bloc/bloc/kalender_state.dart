part of 'kalender_bloc.dart';

@freezed
class KalenderState with _$KalenderState {
  const factory KalenderState.initial() = _Initial;
   const factory KalenderState.loading() = _Loading;
  const factory KalenderState.error(String message) = _Error;
  const factory KalenderState.success(KalenderResponseModel kalender) =
      _Success;
}
