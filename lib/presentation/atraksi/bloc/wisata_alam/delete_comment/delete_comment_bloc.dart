import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_alam_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/comment/delete_comment_alam_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_comment_event.dart';
part 'delete_comment_state.dart';
part 'delete_comment_bloc.freezed.dart';

class DeleteCommentBloc extends Bloc<DeleteCommentEvent, DeleteCommentState> {
  final WisataAlamRemoteDatasource wisataAlamRemoteDatasource;
  DeleteCommentBloc(this.wisataAlamRemoteDatasource)
      : super(DeleteCommentState.initial()) {
    on<DeleteCommentEvent>((event, emit) async {
      await event.when(
          started: () async {},
          deleteCommentAlam: (commentId) async {
            emit(const DeleteCommentState.loading());
            final eitherResponse =
                await wisataAlamRemoteDatasource.deleteCommentAlam(commentId);
            eitherResponse.fold((l) => emit(DeleteCommentState.error(l)),
                (r) => emit(DeleteCommentState.success(r)));
          });
    });
  }
}
