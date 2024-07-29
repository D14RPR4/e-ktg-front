part of 'like_hotel_bloc.dart';

@freezed
class LikeHotelState with _$LikeHotelState {
  const factory LikeHotelState.initial() = _Initial;
  const factory LikeHotelState.loading() = _Loading;
  const factory LikeHotelState.success(LikeHotelResponseModel response) =
      _Success;
  const factory LikeHotelState.error(String message) = _Error;
}
