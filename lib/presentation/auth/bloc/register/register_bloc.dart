import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/auth_remote_datasources.dart';
import 'package:e_ktg_mobile/data/model/request/auth_register_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/responses/auth_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().register(event.data);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
