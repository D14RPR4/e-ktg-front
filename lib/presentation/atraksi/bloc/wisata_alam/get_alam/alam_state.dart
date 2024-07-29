part of 'alam_bloc.dart';

@freezed
class AlamState with _$AlamState {
  const factory AlamState.initial() = _Initial;
  const factory AlamState.loading() =_Loading;
  const factory AlamState.error(String message)=_Error;
const factory AlamState.success(WisataAlamResponseModel alam )=_Success;
}
