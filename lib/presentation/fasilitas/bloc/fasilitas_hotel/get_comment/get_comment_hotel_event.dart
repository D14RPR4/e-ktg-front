part of 'get_comment_hotel_bloc.dart';

@freezed
class GetCommentHotelEvent with _$GetCommentHotelEvent {
  const factory GetCommentHotelEvent.started() = _Started;
  const factory GetCommentHotelEvent.getAllCommentHotel(String postId) = _GetAllCommentHotel;
}
