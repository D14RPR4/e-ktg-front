part of 'resto_bloc.dart';

@freezed
class RestoState with _$RestoState {
  const factory RestoState.initial() = _Initial;
  const factory RestoState.loading() = _Loading;
  const factory RestoState.error(String message) = _Error;
  const factory RestoState.success(FasilitasRestoResponseModel resto) =
      _Success;
}
