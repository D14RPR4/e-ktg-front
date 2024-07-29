part of 'validate_bloc.dart';

@freezed
class ValidateEvent with _$ValidateEvent {
  const factory ValidateEvent.started() = _Started;
  const factory ValidateEvent.validate(
    ValidateRequestModel data,
  ) = _Validate;
}
