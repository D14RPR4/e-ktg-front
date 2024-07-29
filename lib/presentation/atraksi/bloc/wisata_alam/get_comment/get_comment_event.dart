part of 'get_comment_bloc.dart';

@freezed
class GetCommentEvent with _$GetCommentEvent {
  const factory GetCommentEvent.started() = _Started;
  const factory GetCommentEvent.getAllCommentAlam(String postId) = _Like;
}