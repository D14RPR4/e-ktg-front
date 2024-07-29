part of 'delete_comment_bloc.dart';

@freezed
class DeleteCommentState with _$DeleteCommentState {
  const factory DeleteCommentState.initial() = _Initial;
   const factory DeleteCommentState.loading() = _Loading;
  const factory DeleteCommentState.success(DeleteCommentAlamResponseModel response) = _Success;
  const factory DeleteCommentState.error(String message) = _Error;
}
