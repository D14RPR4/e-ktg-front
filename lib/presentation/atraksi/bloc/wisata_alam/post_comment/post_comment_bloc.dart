import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_alam_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/request/comment/comment_alam_request_model.dart';
import 'package:e_ktg_mobile/data/model/responses/comment/comment_alam_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_comment_event.dart';
part 'post_comment_state.dart';
part 'post_comment_bloc.freezed.dart';

class PostCommentBloc extends Bloc<PostCommentEvent, PostCommentState> {
  PostCommentBloc() : super(_Initial()) {
    on<_PostCommentAlam>((event, emit) async {
      await event.when(
        started: () async {
          // Initial event handling if needed
          // emit(some initial state if needed);
        },
        postCommentAlam: (data, postId) async {
          emit(const _Loading());
          final eitherResponse = await WisataAlamRemoteDatasource()
              .postCommentAlam(event.data, postId);
          eitherResponse.fold(
            (failure) => emit(_Error(failure)),
            (response) => emit(_Success(response)),
          );
        },
      );
    });
  }
}
