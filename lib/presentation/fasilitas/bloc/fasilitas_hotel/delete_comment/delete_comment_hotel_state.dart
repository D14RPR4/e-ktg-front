part of 'delete_comment_hotel_bloc.dart';

@freezed
class DeleteCommentHotelState with _$DeleteCommentHotelState {
  const factory DeleteCommentHotelState.initial() = _Initial;
  const factory DeleteCommentHotelState.loading() = _Loading;
  const factory DeleteCommentHotelState.success(
      DeleteCommentHotelResponseModel response) = _Success;
  const factory DeleteCommentHotelState.error(String message) = _Error;
}
