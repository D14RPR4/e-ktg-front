part of 'post_comment_hotel_bloc.dart';

@freezed
class PostCommentHotelState with _$PostCommentHotelState {
  const factory PostCommentHotelState.initial() = _Initial;
  const factory PostCommentHotelState.loading() = _Loading;
  const factory PostCommentHotelState.success(
      CommentHotelResponseModel commentHotelResponseModel) = _Success;
  const factory PostCommentHotelState.error(String message) = _Error;
}
