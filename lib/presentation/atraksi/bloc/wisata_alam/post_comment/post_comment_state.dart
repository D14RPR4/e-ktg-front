part of 'post_comment_bloc.dart';

@freezed
class PostCommentState with _$PostCommentState {
  const factory PostCommentState.initial() = _Initial;
  const factory PostCommentState.loading() = _Loading;
  const factory PostCommentState.success(
      CommentAlamResponseModel commentAlamResponseModel) = _Success;
  const factory PostCommentState.error(String message) = _Error;
}
