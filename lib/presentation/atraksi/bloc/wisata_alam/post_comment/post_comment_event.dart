part of 'post_comment_bloc.dart';

@freezed
class PostCommentEvent with _$PostCommentEvent {
  const factory PostCommentEvent.started() = _Started;
  const factory PostCommentEvent.postCommentAlam(
      CommentAlamRequestModel data, postId) = _PostCommentAlam;
}
