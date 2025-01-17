import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/auth_remote_datasources.dart';
import 'package:e_ktg_mobile/data/model/request/auth_login_request_model.dart';
import 'package:e_ktg_mobile/data/model/responses/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().login(event.data);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
