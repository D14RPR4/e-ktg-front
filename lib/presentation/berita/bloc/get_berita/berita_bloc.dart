import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/berita_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/berita_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'berita_event.dart';
part 'berita_state.dart';
part 'berita_bloc.freezed.dart';

class BeritaBloc extends Bloc<BeritaEvent, BeritaState> {
  final BeritaRemoteDatasource beritaRemoteDatasource;
  BeritaBloc(
    this.beritaRemoteDatasource,
  ) : super(_Initial()) {
    on<BeritaEvent>((event, emit) async {
      emit(const BeritaState.loading());
      final response = await beritaRemoteDatasource.getAllBerita();
      response.fold((l) => emit(BeritaState.error(l)),
          (r) => emit(BeritaState.success(r)));
    });
  }
}
