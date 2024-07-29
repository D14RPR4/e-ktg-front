part of 'get_comment_hotel_bloc.dart';

@freezed
class GetCommentHotelState with _$GetCommentHotelState {
  const factory GetCommentHotelState.initial() = _Initial;
  const factory GetCommentHotelState.loading() = _Loading;
  const factory GetCommentHotelState.success(
      GetCommentHotelResponseModel response) = _Success;
  const factory GetCommentHotelState.error(String message) = _Error;
}
