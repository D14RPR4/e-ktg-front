import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_alam_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/comment/get_comment_alam_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_comment_event.dart';
part 'get_comment_state.dart';
part 'get_comment_bloc.freezed.dart';

class GetCommentBloc extends Bloc<GetCommentEvent, GetCommentState> {
  final WisataAlamRemoteDatasource wisataAlamRemoteDatasource;
  GetCommentBloc(this.wisataAlamRemoteDatasource)
      : super(const GetCommentState.initial()) {
    on<GetCommentEvent>((event, emit) async {
      await event.when(
          started: () async {},
          getAllCommentAlam: (postId) async {
            emit(const GetCommentState.loading());
            final eitherResponse =
                await wisataAlamRemoteDatasource.getAllCommentAlam(postId);
            eitherResponse.fold(
              (failure) => emit(GetCommentState.error(failure)),
              (success) => emit(GetCommentState.success(success)),
            );
          });
    });
  }
}
