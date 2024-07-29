part of 'delete_comment_bloc.dart';

@freezed
class DeleteCommentEvent with _$DeleteCommentEvent {
  const factory DeleteCommentEvent.started() = _Started;
  const factory DeleteCommentEvent.deleteCommentAlam(String commentId) = _DeleteCommentAlam;
}