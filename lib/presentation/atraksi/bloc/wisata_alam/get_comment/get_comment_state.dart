part of 'get_comment_bloc.dart';

@freezed
class GetCommentState with _$GetCommentState {
  const factory GetCommentState.initial() = _Initial;
  const factory GetCommentState.loading() = _Loading;
  const factory GetCommentState.success(GetCommentAlamResponseModel response) =
      _Success;
  const factory GetCommentState.error(String message) = _Error;
}
