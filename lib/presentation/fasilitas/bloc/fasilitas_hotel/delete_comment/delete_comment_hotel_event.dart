part of 'delete_comment_hotel_bloc.dart';

@freezed
class DeleteCommentHotelEvent with _$DeleteCommentHotelEvent {
  const factory DeleteCommentHotelEvent.started() = _Started;
  const factory DeleteCommentHotelEvent.deleteCommentHotel(String commentId) =
      _DeleteCommentHotel;
}
