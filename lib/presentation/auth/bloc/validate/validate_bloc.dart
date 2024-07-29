import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/auth_remote_datasources.dart';
import '../../../../data/model/request/auth_validate_request_model.dart';
import '../../../../data/model/responses/auth_validate_response_model.dart';

part 'validate_event.dart';
part 'validate_state.dart';
part 'validate_bloc.freezed.dart';

class ValidateBloc extends Bloc<ValidateEvent, ValidateState> {
  ValidateBloc() : super(_Initial()) {
    on<_Validate>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().validate(event.data);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
