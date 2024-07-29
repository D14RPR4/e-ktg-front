part of 'post_comment_hotel_bloc.dart';

@freezed
class PostCommentHotelEvent with _$PostCommentHotelEvent {
  const factory PostCommentHotelEvent.started() = _Started;
  const factory PostCommentHotelEvent.postCommentHotel(
      CommentHotelRequestModel data, postId) = _PostCommentHotel;
}
