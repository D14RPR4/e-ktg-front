part of 'berita_bloc.dart';

@freezed
class BeritaState with _$BeritaState {
  const factory BeritaState.initial() = _Initial;
   const factory BeritaState.loading() = _Loading;
  const factory BeritaState.error(String message) = _Error;
  const factory BeritaState.success(BeritaResponseModel berita) =
      _Success;
}
