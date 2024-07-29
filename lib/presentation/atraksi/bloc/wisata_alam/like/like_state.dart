part of 'like_bloc.dart';

@freezed
class LikeState with _$LikeState {
  const factory LikeState.initial() = _Initial;
  const factory LikeState.loading() = _Loading;
  const factory LikeState.success(LikeAlamResponseModel response) = _Success;
  const factory LikeState.error(String message) = _Error;
}
