part of 'validate_bloc.dart';

@freezed
class ValidateState with _$ValidateState {
  const factory ValidateState.initial() = _Initial;
   const factory ValidateState.loading() = _Loading;
  const factory ValidateState.success(
      ValidateResponseModel validateResponseModel) = _Success;
  const factory ValidateState.error(String message) = _Error;
}
